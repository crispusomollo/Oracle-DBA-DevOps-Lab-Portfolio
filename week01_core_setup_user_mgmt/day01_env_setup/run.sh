#!/bin/bash
echo "[*] Starting Oracle 23c environment verification from Ubuntu..."

sqlplus -s chrisorigi/Myles003@//localhost:1539/FREEPDB1 as sysdba <<EOF | tee ./output/db_status.txt
SET HEADING OFF
SELECT 'Instance: ' || instance_name || ', Status: ' || status FROM v\$instance;
EXIT;
EOF

if grep -q "OPEN" ./output/db_status.txt; then
  echo "[✓] Oracle 23c is reachable and instance is OPEN."
else
  echo "[✗] Unable to connect to Oracle or instance not open."
fi

