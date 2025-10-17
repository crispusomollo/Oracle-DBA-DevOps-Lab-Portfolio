#!/bin/bash
# ===========================================================
# Day 3 - Oracle User Management Automation
# ===========================================================
# This script automates user lifecycle operations via SQL*Plus
# Run from Ubuntu against Oracle DB (on Oracle Linux WSL)
# ===========================================================

echo "[*] Running automation for Day 3 ..."

LOG="./output/user_creation.log"
echo "=== User Management Log: $(date) ===" > $LOG

# Database connection details
DB_CONN="chrisorigi/Myles003@//localhost:1539/FREEPDB1 as sysdba"

echo "[*] Dropping existing users..." | tee -a $LOG
sqlplus "$DB_CONN" @"sql/drop_users.sql" >> $LOG

echo "[*] Creating users and roles..." | tee -a $LOG
sqlplus "$DB_CONN" @"sql/create_users.sql" >> $LOG

echo "[*] Granting custom roles..." | tee -a $LOG
sqlplus "$DB_CONN" @"sql/grant_roles.sql" >> $LOG

echo "[✓] User setup complete. Review $LOG for details."

