#!/bin/bash
# ============================================================
# RMAN Full Database Backup Script
# ============================================================

BACKUP_DIR="/opt/oracle/backups/full"
LOG="./output/rman_full_$(date +%Y%m%d).log"
MANIFEST="./output/full_manifest.json"
DB_CONN="sys/YourSysPassword@//localhost:1521/FREEPDB1 as sysdba"

mkdir -p $BACKUP_DIR

echo "=== RMAN Full Backup Log: $(date) ===" | tee $LOG

rman target / <<EOF | tee -a $LOG
RUN {
  ALLOCATE CHANNEL c1 DEVICE TYPE DISK FORMAT '$BACKUP_DIR/full_%U.bkp';
  BACKUP DATABASE TAG 'FULL_BACKUP_$(date +%Y%m%d)';
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
@sql/register_rman_backup.sql 'DATABASE' 'FULL' '$STATUS' '$BACKUP_DIR'
EOSQL

# Create JSON manifest
cat <<EOF > $MANIFEST
{
  "backup_type": "FULL",
  "date": "$(date)",
  "location": "$BACKUP_DIR",
  "status": "$STATUS"
}
EOF

echo "[✓] Full backup $STATUS. Manifest saved to $MANIFEST"

