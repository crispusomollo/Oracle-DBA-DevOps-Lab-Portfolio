#!/bin/bash
# =========================================================
# Backup & Verification Pipeline with Log Rotation
# =========================================================

# --- Configuration ---
DB_CONN="sys/Myles003@//localhost:1539/FREEPDB1 as sysdba"
LOG_DIR="$HOME/oracle-backup/output"
mkdir -p "$LOG_DIR"

LOG_DATE=$(date +%Y%m%d)
RMAN_LOG="$LOG_DIR/rman_log_${LOG_DATE}.log"
DATAPUMP_LOG="$LOG_DIR/datapump_log_${LOG_DATE}.log"
FLASHBACK_LOG="$LOG_DIR/flashback_check.log"

# --- Log rotation: keep last 7 days ---
find "$LOG_DIR" -type f -mtime +7 -exec rm -f {} \;

echo "=== [$(date)] Starting Backup Pipeline ==="

# -------------------------
# 1. Flashback Check
# -------------------------
echo "[*] Checking Flashback..." | tee -a "$FLASHBACK_LOG"
sqlplus -s "$DB_CONN" <<EOF | tee -a "$FLASHBACK_LOG"
SET PAGESIZE 50
SET LINESIZE 100
COL FLASHBACK_ON FORMAT A10
SELECT FLASHBACK_ON FROM V\$DATABASE;
EXIT
EOF

# -------------------------
# 2. RMAN Backup
# -------------------------
echo "[*] Running RMAN backup..." | tee -a "$RMAN_LOG"
rman target / <<EOF | tee -a "$RMAN_LOG"
CONFIGURE RETENTION POLICY TO REDUNDANCY 2;
BACKUP AS COMPRESSED BACKUPSET DATABASE PLUS ARCHIVELOG;
CROSSCHECK BACKUP;
DELETE NOPROMPT OBSOLETE;
EXIT
EOF

if grep -q "Finished backup" "$RMAN_LOG"; then
    echo "[✓] RMAN backup completed successfully." | tee -a "$RMAN_LOG"
else
    echo "[✗] RMAN backup encountered an issue." | tee -a "$RMAN_LOG"
fi

# -------------------------
# 3. Data Pump Export
# -------------------------
echo "[*] Running Data Pump export..." | tee -a "$DATAPUMP_LOG"
expdp sys/Myles003@//localhost:1539/freepdb1 parfile=sql/datapump_expdp.par | tee -a "$DATAPUMP_LOG"

if grep -q "Job .* successfully completed" "$DATAPUMP_LOG"; then
    echo "[✓] Data Pump export completed successfully." | tee -a "$DATAPUMP_LOG"
else
    echo "[✗] Data Pump export failed." | tee -a "$DATAPUMP_LOG"
fi

# -------------------------
# 4. Verification
# -------------------------
echo "=== [$(date)] Running Backup Verification ==="

python3 - <<EOF
import os
from datetime import datetime
import cx_Oracle

LOG_DIR = "$LOG_DIR"
LOG_DATE = "$LOG_DATE"
RMAN_LOG = os.path.join(LOG_DIR, f"rman_log_{LOG_DATE}.log")
DATAPUMP_LOG = os.path.join(LOG_DIR, f"datapump_log_{LOG_DATE}.log")

def check_log(log_file, keyword):
    if os.path.exists(log_file):
        with open(log_file, "r") as f:
            content = f.read()
        return keyword in content
    return False

def verify_flashback():
    try:
        conn = cx_Oracle.connect("sys/Myles003@//localhost:1539/FREEPDB1", mode=cx_Oracle.SYSDBA)
        cur = conn.cursor()
        cur.execute("SELECT FLASHBACK_ON FROM V\$DATABASE")
        status = cur.fetchone()[0]
        conn.close()
        return status == "YES"
    except Exception as e:
        print("[✗] Flashback verification failed:", e)
        return False

print("=== Backup Verification Report ===")
print("Date:", datetime.now())

if check_log(RMAN_LOG, "Finished backup"):
    print("[✓] RMAN backup verified.")
else:
    print("[✗] RMAN log not found or backup failed.")

if check_log(DATAPUMP_LOG, "successfully completed"):
    print("[✓] Data Pump export verified.")
else:
    print("[✗] Data Pump log not found or export failed.")

if verify_flashback():
    print("[✓] Flashback is enabled and operational.")
else:
    print("[✗] Flashback not enabled.")
EOF

echo "=== [$(date)] Pipeline & Verification Completed ==="
echo "[✓] Logs saved in $LOG_DIR (old logs >7 days removed)"

