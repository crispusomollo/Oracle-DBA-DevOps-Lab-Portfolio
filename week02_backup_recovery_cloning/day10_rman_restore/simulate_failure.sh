#!/bin/bash
# ============================================================
# Simulate Media Failure by Renaming or Deleting a Datafile
# ============================================================

DB_CONN="sys/YourSysPassword@//localhost:1521/FREEPDB1 as sysdba"
LOG="./output/simulate_failure_$(date +%Y%m%d).log"

echo "=== Simulating Media Failure ===" | tee $LOG
sqlplus -s "$DB_CONN" <<EOF | tee -a $LOG
SET LINES 200
COL FILE_NAME FOR A80
SELECT FILE_NAME FROM dba_data_files WHERE ROWNUM = 1;
EXIT;
EOF

DATAFILE_PATH=$(grep -E '/.*\.dbf' $LOG | head -1)

if [[ -n "$DATAFILE_PATH" && -f "$DATAFILE_PATH" ]]; then
  echo "[*] Found datafile: $DATAFILE_PATH" | tee -a $LOG
  echo "[!] Simulating failure: renaming datafile..." | tee -a $LOG
  mv "$DATAFILE_PATH" "${DATAFILE_PATH}.bak"
  echo "[✓] Datafile renamed to simulate failure." | tee -a $LOG
else
  echo "[✗] Could not locate a valid datafile path." | tee -a $LOG
fi

