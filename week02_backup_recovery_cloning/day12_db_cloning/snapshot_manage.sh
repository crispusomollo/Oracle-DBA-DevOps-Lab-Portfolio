#!/bin/bash
# ============================================================
# Automated Snapshot Creation and Restore for PDBs
# ============================================================

DB_CONN="sys/YourSysPassword@//localhost:1521/FREE as sysdba"
TARGET_PDB="FREEPDB1_CLONE"
SNAPSHOT_NAME="SNAP_$(date +%Y%m%d_%H%M)"
LOG="./output/snapshot_log_$(date +%Y%m%d).log"

echo "=== Managing Snapshot for $TARGET_PDB ===" | tee $LOG

sqlplus -s "$DB_CONN" <<EOF | tee -a $LOG
ALTER SESSION SET CONTAINER = $TARGET_PDB;

-- Create snapshot
CREATE SNAPSHOT $SNAPSHOT_NAME;
SELECT SNAPSHOT_NAME, SNAPSHOT_TIME FROM DBA_PDB_SNAPSHOTS WHERE SNAPSHOT_NAME = '$SNAPSHOT_NAME';

-- Rollback example
-- FLASHBACK PLUGGABLE DATABASE TO SNAPSHOT $SNAPSHOT_NAME;

EXIT;
EOF

if grep -q "$SNAPSHOT_NAME" "$LOG"; then
  echo "[✓] Snapshot $SNAPSHOT_NAME created successfully." | tee -a $LOG
else
  echo "[✗] Snapshot creation failed." | tee -a $LOG
fi

