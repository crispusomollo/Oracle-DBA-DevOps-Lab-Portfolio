#!/bin/bash
# ===========================================================
# Day 7 - Backup Verification Automation (RMAN Simulation)
# ===========================================================
# Simulates Oracle backups and registers them in DB
# ===========================================================

echo "[*] Running automation for Day 7..."

DB_CONN="chrisorigi/Myles003@//localhost:1539/FREEPDB1 as sysdba"
LOG="./output/simulated_backup.log"
BACKUP_PATH="/opt/oracle/backups"
MANIFEST="./output/backup_manifest.json"

echo "=== Backup Simulation Log: $(date) ===" > $LOG

# Step 1: Create backup directory (if not exists)
echo "[*] Creating Oracle directory object..." | tee -a $LOG
sqlplus -s "$DB_CONN" @"sql/create_backup_dir.sql" >> $LOG

# Step 2: Simulate a backup file
echo "[*] Generating simulated backup files..." | tee -a $LOG
mkdir -p $BACKUP_PATH
dd if=/dev/zero of=$BACKUP_PATH/sim_backup_$(date +%F_%H%M%S).bak bs=1M count=50 status=none
echo "[✓] Simulated backup file created at $BACKUP_PATH" | tee -a $LOG

# Step 3: Register backup entry in DB
echo "[*] Registering simulated backup in database..." | tee -a $LOG
sqlplus -s "$DB_CONN" @"sql/register_backup.sql" >> $LOG

# Step 4: Create a manifest file
cat <<EOF > $MANIFEST
{
  "backup_name": "FULL_DB_SIM_BACKUP",
  "backup_type": "FULL",
  "created_on": "$(date)",
  "path": "$BACKUP_PATH",
  "status": "COMPLETED"
}
EOF

echo "[✓] Backup manifest created: $MANIFEST" | tee -a $LOG

echo "[+] Backup simulation complete. Logs stored in $LOG"


