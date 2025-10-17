#!/bin/bash
# ===========================================================
# Day 6 - Auditing & Security Policy Automation
# ===========================================================
# Automates Oracle auditing setup and verification from Ubuntu
# ===========================================================

LOG="./output/audit_ops.log"
echo "=== Audit Setup Log: $(date) ===" > $LOG

DB_CONN="sys/YourSysPassword@//localhost:1521/FREEPDB1 as sysdba"

echo "[*] Dropping existing audit policies..." | tee -a $LOG
sqlplus -s "$DB_CONN" @"sql/drop_audit_policies.sql" >> $LOG

echo "[*] Enabling unified auditing..." | tee -a $LOG
sqlplus -s "$DB_CONN" @"sql/enable_auditing.sql" >> $LOG

echo "[*] Creating new audit policies..." | tee -a $LOG
sqlplus -s "$DB_CONN" @"sql/create_audit_policies.sql" >> $LOG

echo "[✓] Audit setup and policy creation complete. See $LOG for details."

