#!/bin/bash
# ============================================================
# Oracle Data Pump Schema Export Automation
# ============================================================

DB_USER="hr"
DB_PASS="hr"
SERVICE="FREEPDB1"
DUMP_DIR="/opt/oracle/admin/FREEPDB1/dpdump"
BACKUP_DIR="$DUMP_DIR/$(date +%Y%m%d)"
LOG="./output/export_log_$(date +%Y%m%d).log"

mkdir -p "$BACKUP_DIR"

echo "=== Starting HR schema export on $(date) ===" | tee $LOG

expdp "$DB_USER/$DB_PASS@$SERVICE" \
SCHEMAS=HR \
DUMPFILE=hr_schema_$(date +%Y%m%d).dmp \
LOGFILE=hr_export_$(date +%Y%m%d).log \
DIRECTORY=DATA_PUMP_DIR \
REUSE_DUMPFILES=Y \
COMPRESSION=ALL

if [[ $? -eq 0 ]]; then
  echo "[✓] Export completed successfully." | tee -a $LOG
else
  echo "[✗] Export failed. Check Data Pump logs in Oracle." | tee -a $LOG
fi

