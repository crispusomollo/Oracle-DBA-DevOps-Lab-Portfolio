#!/bin/bash
#archivelog_mgmt.sh

echo "[*] Running automation for Day ..."
# TODO: Add SQL or Bash commands

ARCH_DIR="/opt/oracle/fast_recovery_area/FREE/archivelog"
RETENTION_DAYS=3

find $ARCH_DIR -type f -mtime +$RETENTION_DAYS -name "*.arc" -exec rm -f {} \;
echo "$(date): Old archive logs purged" >> /opt/oracle/logs/archive_cleanup.log

