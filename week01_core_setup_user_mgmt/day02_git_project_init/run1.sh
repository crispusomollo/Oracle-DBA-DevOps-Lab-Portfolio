#!/bin/bash

LOGFILE=logs/cleanup_$(date +%Y%m%d_%H%M%S).log
mkdir -p logs

echo "[*] Running automation for Day 3 ..." | tee -a "$LOGFILE"
echo "[*] Dropping existing users and tablespace..." | tee -a "$LOGFILE"

sqlplus chrisorigi/Myles003@//localhost:1539/freepdb1 as sysdba <<EOF | tee -a "$LOGFILE"
@sql/clean_env.sql
EXIT
EOF

read -t 10 -p "Press Enter to clear the screen (auto-clears in 10s)..." _ || true
clear

