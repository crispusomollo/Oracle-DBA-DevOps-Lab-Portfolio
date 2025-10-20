#!/bin/bash
# ============================================================
# Day 8 - RMAN Configuration & Environment Setup
# ============================================================

DB_CONN="chrisorigi/Myles003@//localhost:1539/FREEPDB1 as sysdba"
LOG="./output/env_check.log"
JSON="./output/rman_env_status.json"

echo "[*] Running automation for Day ..."

echo "=== RMAN Setup Environment Check: $(date) ===" | tee $LOG

# Step 1: Verify Oracle directories
BACKUP_DIR="/opt/oracle/backups"
ARCHIVE_DIR="/opt/oracle/archivelog"
mkdir -p $BACKUP_DIR $ARCHIVE_DIR

echo "[✓] Directories verified: $BACKUP_DIR, $ARCHIVE_DIR" | tee -a $LOG

# Step 2: Verify Oracle environment variables
if [ -z "$ORACLE_HOME" ]; then
  echo "[✗] ORACLE_HOME not set!" | tee -a $LOG
else
  echo "[✓] ORACLE_HOME: $ORACLE_HOME" | tee -a $LOG
fi

if [ -z "$ORACLE_SID" ]; then
  echo "[✗] ORACLE_SID not set!" | tee -a $LOG
else
  echo "[✓] ORACLE_SID: $ORACLE_SID" | tee -a $LOG
fi

# Step 3: Create RMAN catalog user
echo "[*] Creating RMAN catalog user..." | tee -a $LOG
sqlplus "$DB_CONN" @"sql/create_rman_catalog_user.sql" >> $LOG

# Step 4: Run environment checks with Python
python3 verify.py | tee -a $LOG

# Step 5: Save environment status as JSON
cat <<EOF > $JSON
{
  "backup_dir": "$BACKUP_DIR",
  "archive_dir": "$ARCHIVE_DIR",
  "oracle_home": "${ORACLE_HOME:-NOT SET}",
  "oracle_sid": "${ORACLE_SID:-NOT SET}",
  "rman_user": "rman",
  "status": "initialized"
}
EOF

echo "[✓] RMAN environment initialized. Log: $LOG"

