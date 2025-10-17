#!/bin/bash
# ============================================================
# RMAN Restore & Recovery Script (Media Failure Simulation)
# ============================================================

LOG="./output/restore_recovery_$(date +%Y%m%d).log"
DB_CONN="sys/YourSysPassword@//localhost:1521/FREEPDB1 as sysdba"

echo "=== Starting RMAN Restore & Recovery: $(date) ===" | tee $LOG

# Step 1: Mount Database if Needed
rman target / <<EOF | tee -a $LOG
STARTUP MOUNT;
EOF

# Step 2: Restore Database
rman target / <<EOF | tee -a $LOG
RUN {
  ALLOCATE CHANNEL c1 DEVICE TYPE DISK;
  RESTORE DATABASE;
  RECOVER DATABASE;
  RELEASE CHANNEL c1;
}
EOF

# Step 3: Open Database
rman target / <<EOF | tee -a $LOG
ALTER DATABASE OPEN;
EOF

# Step 4: Verify datafile status
sqlplus -s "$DB_CONN" <<EOSQL | tee -a $LOG
@sql/check_datafiles.sql
EOSQL

if grep -q "ONLINE" "$LOG"; then
  echo "[✓] Database restored and recovered successfully."
else
  echo "[✗] Recovery may have failed, please review logs."
fi

