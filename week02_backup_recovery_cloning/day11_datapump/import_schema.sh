#!/bin/bash
# ============================================================
# Oracle Data Pump Schema Import Automation
# ============================================================

DB_USER="hr"
DB_PASS="hr"
SERVICE="FREEPDB1"
DUMPFILE="hr_schema_$(date +%Y%m%d).dmp"
LOG="./output/import_log_$(date +%Y%m%d).log"

echo "=== Starting HR schema import on $(date) ===" | tee $LOG

impdp "$DB_USER/$DB_PASS@$SERVICE" \
SCHEMAS=HR \
DUMPFILE=$DUMPFILE \
LOGFILE=hr_import_$(date +%Y%m%d).log \
DIRECTORY=DATA_PUMP_DIR \
REMAP_SCHEMA=HR:HR_RESTORE \
TRANSFORM=DISABLE_ARCHIVE_LOGGING:Y \
TABLE_EXISTS_ACTION=REPLACE

if [[ $? -eq 0 ]]; then
  echo "[✓] Import completed successfully." | tee -a $LOG
else
  echo "[✗] Import failed. Review Oracle logs." | tee -a $LOG
fi

