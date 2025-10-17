#!/bin/bash
# ============================================================
# Automated PDB Cloning Script
# ============================================================

DB_CONN="sys/YourSysPassword@//localhost:1521/FREE as sysdba"
SOURCE_PDB="FREEPDB1"
CLONE_PDB="FREEPDB1_CLONE"
LOG="./output/clone_log_$(date +%Y%m%d).log"

echo "=== Starting PDB Clone Process: $(date) ===" | tee $LOG

sqlplus -s "$DB_CONN" <<EOF | tee -a $LOG
ALTER SESSION SET CONTAINER = CDB$ROOT;
-- Close clone if it exists
BEGIN
   EXECUTE IMMEDIATE 'ALTER PLUGGABLE DATABASE $CLONE_PDB CLOSE IMMEDIATE';
   EXECUTE IMMEDIATE 'DROP PLUGGABLE DATABASE $CLONE_PDB INCLUDING DATAFILES';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

-- Create new clone from source
CREATE PLUGGABLE DATABASE $CLONE_PDB FROM $SOURCE_PDB
FILE_NAME_CONVERT=('/opt/oracle/oradata/FREEPDB1/',
                   '/opt/oracle/oradata/$CLONE_PDB/');

-- Open clone
ALTER PLUGGABLE DATABASE $CLONE_PDB OPEN READ WRITE;

-- Check status
@sql/pdb_open_status.sql
EXIT;
EOF

if grep -q "READ WRITE" "$LOG"; then
  echo "[✓] $CLONE_PDB cloned and opened successfully." | tee -a $LOG
else
  echo "[✗] Cloning may have failed. Check logs." | tee -a $LOG
fi

