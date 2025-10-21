#!/bin/bash
# ============================================================
# Backup Verification Automation
# ============================================================

DB_CONN="sys/Myles003@//localhost:1539/FREEPDB1 as sysdba"
LOG_DATE=$(date +%Y%m%d)
REPORT="./output/backup_status_report_${LOG_DATE}.log"

echo "=== Backup Verification Report - $(date) ===" | tee $REPORT
echo "---------------------------------------------" | tee -a $REPORT

# 1. Check RMAN backup status
echo "[*] Checking RMAN backup logs..." | tee -a $REPORT
grep -iE "error|fail|corrupt" ./../day13_flashback_rman_datapump/output/rman_log_${LOG_DATE}.log >> $REPORT 2>/dev/null
if [ $? -eq 0 ]; then
  echo "[✓] RMAN backup check done." | tee -a $REPORT
else
  echo "[✗] RMAN log not found or unreadable." | tee -a $REPORT
fi

# 2. Check Data Pump logs
echo "[*] Checking Data Pump logs..." | tee -a $REPORT
grep -iE "ORA-|fail|error" ./../day13_flashback_rman_datapump/output/datapump_log_${LOG_DATE}.log >> $REPORT 2>/dev/null
if [ $? -eq 0 ]; then
  echo "[✓] Data Pump check done." | tee -a $REPORT
else
  echo "[✗] Data Pump log not found or unreadable." | tee -a $REPORT
fi

# 3. Flashback validation
echo "[*] Checking Flashback state..." | tee -a $REPORT
sqlplus -s "$DB_CONN" <<EOF | tee -a $REPORT
@sql/check_rman_catalog.sql
SELECT FLASHBACK_ON FROM V$DATABASE;
EXIT;
EOF

# 4. Run Python parser for deeper insights
echo "[*] Running log parser..." | tee -a $REPORT
python3 parse_logs.py >> $REPORT 2>&1

echo "=== Verification Completed - $(date) ===" | tee -a $REPORT

