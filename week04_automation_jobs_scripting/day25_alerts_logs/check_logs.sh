#!/bin/bash
LOG_DIR="../day23_bash_backup_rotation/output"
ALERT_LOG="./output/monitor_log.txt"
echo "[*] Checking backup logs..." | tee -a $ALERT_LOG

if grep -q "failed" $LOG_DIR/*.txt; then
  echo "[✗] Backup failure detected." | tee -a $ALERT_LOG
  ./bash/email_alert.sh "Backup Failure Detected" "Check backup logs immediately."
else
  echo "[✓] All backups successful." | tee -a $ALERT_LOG
fi

