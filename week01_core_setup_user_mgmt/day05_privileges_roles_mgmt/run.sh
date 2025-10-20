#!/bin/bash
# ===========================================================
# Day 5 - Privileges & Roles Management Automation
# ===========================================================
# Automates Oracle role and privilege configuration from Ubuntu
# ===========================================================

LOG="./output/roles_ops.log"
echo "=== Roles & Privilege Management Log: $(date) ===" > "$LOG"

DB_CONN="chrisorigi/Myles003@//localhost:1539/freepdb1"

echo "[*] Dropping existing roles..." | tee -a "$LOG"
sqlplus "$DB_CONN" @"sql/drop_roles.sql" >> "$LOG"

echo "[*] Creating new roles..." | tee -a "$LOG"
sqlplus "$DB_CONN" @"sql/create_roles.sql" >> "$LOG"

echo "[*] Granting privileges..." | tee -a "$LOG"
sqlplus "$DB_CONN" @"sql/grant_privileges.sql" >> "$LOG"

echo "[✓] Role and privilege setup complete. See $LOG for details."

