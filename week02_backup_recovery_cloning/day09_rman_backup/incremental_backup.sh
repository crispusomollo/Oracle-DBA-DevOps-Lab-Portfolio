#!/bin/bash
# ============================================================
# RMAN Incremental Level 1 Backup Script
# ============================================================

BACKUP_DIR="/opt/oracle/backups/incremental"
LOG="./output/rman_incr_$(date +%Y%m%d).log"
MANIFEST="./output/incr_manifest.json"
DB_CONN="sys/YourSysPassword@//localhost:1521/FREEPDB1 as sysdba"

mkdir -p $BACKUP_DIR

echo "=== RMAN Incremental Backup Log: $(date) ===" | tee $LOG

rman target / <<EOF | tee -a $LOG
RUN {
  ALLOCATE CHANNEL c1 DEVICE TYPE DISK FORMAT '$BACKUP_DIR/incr_%U.bkp';
  BACKUP INCREMENTAL LEVEL 1 DATABASE TAG 'INCR_BACKUP_$(date +%Y%m%d)';
  RELEASE CHANNEL c1;
}
EOF

if grep -q "Finished backup" "$LOG"; then
  STATUS="COMPLETED"
else
  STATUS="FAILED"
fi

# Register backup in DB
sqlplus -s "$DB_CONN" <<EOSQL
@sql/register_rman_backup.sql 'DATABASE' 'INCR' '$STATUS' '$BACKUP_DIR'
EOSQL

# Create JSON manifest
cat <<EOF > $MANIFEST
{
  "backup_type": "INCREMENTAL",
  "date": "$(date)",
  "location": "$BACKUP_DIR",
  "status": "$STATUS"
}
EOF

echo "[✓] Incremental backup $STATUS. Manifest saved to $MANIFEST"

