#!/bin/bash
# rman_backup_rotate.sh - create RMAN backup, rotate local backups, upload to OCI (optional)
set -euo pipefail
LOG_DIR="/opt/oracle/output"
BKP_DIR="/opt/oracle/backups"
RETention_DAYS=7#!/bin/bash
# rman_backup_rotate.sh - create RMAN backup, rotate local backups, upload to OCI (optional)
set -euo pipefail
LOG_DIR="/u01/logs"
BKP_DIR="/opt/oracle/backups"
RETention_DAYS=7
OCI_BUCKET="${OCI_BUCKET:-oracle-lab-backups}"
OCI_NAMESPACE="${OCI_NAMESPACE:-}"
OCI_PROFILE="${OCI_PROFILE:-default}"

mkdir -p "$BKP_DIR" "$LOG_DIR"

echo "[$(date -Is)] Starting RMAN backup" | tee -a $LOG_DIR/backup_pipeline.log

# Run RMAN backup using rman script
rman target / cmdfile=rman_backup.rcv log=$LOG_DIR/rman_$(date +%F_%H%M).log

# Rotate local backups
find "$BKP_DIR" -type f -mtime +$RETention_DAYS -print -delete >> $LOG_DIR/backup_pipeline.log 2>&1 || true

# Optional: upload latest backup to OCI Object Storage if OCI CLI configured
if command -v oci >/dev/null 2>&1 && [ -n "$OCI_BUCKET" ] && [ -n "$OCI_NAMESPACE" ]; then
  LATEST=$(ls -1t ${BKP_DIR}/*.bkp 2>/dev/null | head -n1 || true)
  if [ -n "$LATEST" ]; then
    OBJNAME="rman/$(hostname)/$(basename $LATEST)"
    echo "Uploading $LATEST to oci://$OCI_BUCKET/$OBJNAME" >> $LOG_DIR/backup_pipeline.log
    oci os object put --bucket-name $OCI_BUCKET --name "$OBJNAME" --file "$LATEST" --namespace-name "$OCI_NAMESPACE" --profile "$OCI_PROFILE"
  fi
fi

echo "[$(date -Is)] RMAN backup completed" | tee -a $LOG_DIR/backup_pipeline.log

OCI_BUCKET="${OCI_BUCKET:-oracle-lab-backups}"
OCI_NAMESPACE="${OCI_NAMESPACE:-}"
OCI_PROFILE="${OCI_PROFILE:-default}"

mkdir -p "$BKP_DIR" "$LOG_DIR"

echo "[$(date -Is)] Starting RMAN backup" | tee -a $LOG_DIR/backup_pipeline.log

# Run RMAN backup using rman script
rman target / cmdfile=rman_backup.rcv log=$LOG_DIR/rman_$(date +%F_%H%M).log

# Rotate local backups
find "$BKP_DIR" -type f -mtime +$RETention_DAYS -print -delete >> $LOG_DIR/backup_pipeline.log 2>&1 || true

# Optional: upload latest backup to OCI Object Storage if OCI CLI configured
if command -v oci >/dev/null 2>&1 && [ -n "$OCI_BUCKET" ] && [ -n "$OCI_NAMESPACE" ]; then
  LATEST=$(ls -1t ${BKP_DIR}/*.bkp 2>/dev/null | head -n1 || true)
  if [ -n "$LATEST" ]; then
    OBJNAME="rman/$(hostname)/$(basename $LATEST)"
    echo "Uploading $LATEST to oci://$OCI_BUCKET/$OBJNAME" >> $LOG_DIR/backup_pipeline.log
    oci os object put --bucket-name $OCI_BUCKET --name "$OBJNAME" --file "$LATEST" --namespace-name "$OCI_NAMESPACE" --profile "$OCI_PROFILE"
  fi
fi

echo "[$(date -Is)] RMAN backup completed" | tee -a $LOG_DIR/backup_pipeline.log

