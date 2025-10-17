#!/bin/bash
# ===========================================================
# Day 4 - Tablespace & Storage Management Automation
# ===========================================================
# Automates tablespace lifecycle operations from Ubuntu
# ===========================================================

LOG="./output/tablespace_ops.log"
echo "=== Tablespace Operations Log: $(date) ===" > $LOG

DB_CONN="chrisorigi/Myles003@//localhost:1539/FREEPDB1 as sysdba"

echo "[*] Dropping existing tablespaces..." | tee -a $LOG
sqlplus "$DB_CONN" @"sql/drop_tablespaces.sql" >> $LOG

echo "[*] Creating new tablespaces..." | tee -a $LOG
sqlplus "$DB_CONN" @"sql/create_tablespaces.sql" >> $LOG

echo "[*] Assigning quotas..." | tee -a $LOG
sqlplus "$DB_CONN" @"sql/assign_quotas.sql" >> $LOG

echo "[*] Resizing tablespaces..." | tee -a $LOG
sqlplus "$DB_CONN" @"sql/resize_tablespace.sql" >> $LOG

echo "[✓] Tablespace setup and management complete. See $LOG for details."

