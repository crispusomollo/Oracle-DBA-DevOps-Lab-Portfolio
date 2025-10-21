!/bin/bash
# Oracle Backup Script with Log Rotation

BACKUP_DIR="$HOME/OracleBackups"
LOG_DIR="$BACKUP_DIR/logs"
DATE=$(date +"%Y%m%d_%H%M%S")
LOG_FILE="$LOG_DIR/backup_$DATE.log"
DAYS_TO_KEEP=7

mkdir -p "$LOG_DIR"

echo "[*] Starting backup at $(date)" | tee -a "$LOG_FILE"

# Simulate Oracle RMAN or expdp job
tar -czf "$BACKUP_DIR/backup_$DATE.tar.gz" /home/chrisorigi >> "$LOG_FILE" 2>&1

echo "[+] Backup complete. Log: $LOG_FILE" | tee -a "$LOG_FILE"

find "$LOG_DIR" -type f -mtime +$DAYS_TO_KEEP -name "backup_*.log" -exec rm -f {} \;
echo "[*] Old logs cleaned up." | tee -a "$LOG_FILE"

