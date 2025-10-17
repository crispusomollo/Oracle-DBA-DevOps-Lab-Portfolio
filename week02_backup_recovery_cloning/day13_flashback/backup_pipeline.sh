#!/bin/bash
# ============================================================
# Unified Backup Workflow: RMAN + Data Pump + Flashback
# ============================================================

DB_CONN="sys/YourSysPassword@//localhost:1521/FREE as sysdba"
LOG_DATE=$(date +%Y%m%d)
RMAN_LOG="./output/rman_log_${LOG_DATE}.log"
DATAPUMP_LOG="./output/datapump_log_${LOG_DATE}.log"
FLASHBACK_LOG="./output/flashback_check.log"

echo "=== [$(date)] Starting Integrated Backup Pipeline ===" | tee $RMAN_LOG

# 1. Verify Flashback
sqlplus -s "$DB_CONN" <<EOF | tee -a $FLASHBACK_LOG
@sql/check_flashback.sql
EOF

# 2. Run RMAN Backup
rman target / <<EOF | tee -a $RMAN_LOG
CONFIGURE RETENTION POLICY TO REDUNDANCY 2;
BACKUP AS COMPRESSED BACKUPSET DATABASE PLUS ARCHIVELOG;
CROSSCHECK BACKUP;
DELETE NOPROMPT OBSOLETE;
EOF

if grep -q "Finished backup" "$RMAN_LOG"; then
  echo "[✓] RMAN Backup completed successfully." | tee -a $RMAN_LOG
else
  echo "[✗] RMAN Backup encountered an issue." | tee -a $RMAN_LOG
fi

# 3. Run Data Pump Export
echo "[*] Starting Data Pump Export..." | tee -a $DATAPUMP_LOG
expdp system/YourSysPassword parfile=sql/datapump_expdp.par | tee -a $DATAPUMP_LOG

if grep -q "Job .* successfully completed" "$DATAPUMP_LOG"; then
  echo "[✓] Data Pump Export completed successfully." | tee -a $DATAPUMP_LOG
else
  echo "[✗] Data Pump Export failed." | tee -a $DATAPUMP_LOG
fi

echo "=== [$(date)] Backup Pipeline Completed ===" | tee -a $RMAN_LOG

