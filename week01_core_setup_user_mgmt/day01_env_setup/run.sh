#!/bin/bash
echo "[*] Configuring Oracle environment..."

# Example environment variables (adjust as needed)
export ORACLE_HOME=/opt/oracle/product/23c/dbhomeFree
export ORACLE_SID=FREEPDB1
export PATH=$ORACLE_HOME/bin:$PATH

echo "[✓] Environment variables set."

echo "[*] Checking listener status..."
lsnrctl status

echo "[*] Displaying SQL*Plus version..."
sqlplus -v

echo "[*] Done."

