#!/bin/bash
# =========================================================
# Unified Backup Pipeline: RMAN + Data Pump + Flashback
# =========================================================

# --- Configuration ---
DB_CONN="sys/Myles003@//localhost:1539/FREEPDB1 as sysdba"
LOG_DIR="$HOME/oracle-backup/output"   # Make sure this folder exists
mkdir -p "$LOG_DIR"

LOG_DATE=$(date +%Y%m%d)
RMAN_LOG="$LOG_DIR/rman_log_${LOG_DATE}.log"
DATAPUMP_LOG="$LOG_DIR/datapump_log_${LOG_DATE}.log"
FLASHBACK_LOG="$LOG_DIR/flashback_check.log"

echo "=== [$(date)] Starting Backup Pipeline ===" | tee -a "$RMAN_LOG"

# -------------------------
# 1. Verify Flashback
# -------------------------
echo "[*] Checking Flashback status..." | tee -a "$FLASHBACK_LOG"
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
echo "[*] Starting RMAN backup..." | tee -a "$RMAN_LOG"
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
echo "[*] Starting Data Pump Export..." | tee -a "$DATAPUMP_LOG"
expdp sys/Myles003@//localhost:1539/freepdb1 parfile=sql/datapump_expdp.par | tee -a "$DATAPUMP_LOG"

if grep -q "Job .* successfully completed" "$DATAPUMP_LOG"; then
    echo "[✓] Data Pump Export completed successfully." | tee -a "$DATAPUMP_LOG"
else
    echo "[✗] Data Pump Export failed." | tee -a "$DATAPUMP_LOG"
fi

# -------------------------
# Pipeline Completed
# -------------------------
echo "=== [$(date)] Backup Pipeline Completed ===" | tee -a "$RMAN_LOG"
echo "[✓] Logs saved in $LOG_DIR"

