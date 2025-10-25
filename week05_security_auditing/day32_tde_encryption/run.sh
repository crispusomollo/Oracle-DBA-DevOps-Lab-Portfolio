#!/bin/bash
echo "[*] Running automation for Day 32 ..."
# TODO: Add SQL or Bash commands
# verify_tde.sh
sqlplus -s chrisorigi/Myles003@//localhost:1539/freepdb1 as sysdba <<EOF
SET LINES 200
SELECT WRL_PARAMETER, STATUS FROM V\$ENCRYPTION_WALLET;
SELECT TABLESPACE_NAME, ENCRYPTED FROM DBA_TABLESPACES;
EOF

