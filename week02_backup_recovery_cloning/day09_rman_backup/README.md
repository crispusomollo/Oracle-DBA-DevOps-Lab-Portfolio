# Day 9 – Automated Full & Incremental RMAN Backups

## 🎯 Objective

Automate full and incremental RMAN database backups with logging and JSON tracking.

---

## ⚙️ Steps

1. Run `full_backup.sh` for a complete database backup.  
2. Run `incremental_backup.sh` for a level 1 backup.  
3. Check `verify_rman_backup.py` for confirmation and manifests.

---

## 📂 Files

| File | Description |
|------|--------------|
| `full_backup.sh` | Full RMAN backup automation |
| `incremental_backup.sh` | Incremental RMAN backup automation |
| `register_rman_backup.sql` | Inserts backup log into database |
| `verify_rman_backup.py` | Verifies backup results and JSON manifests |
| `view_backup_history.sql` | Views RMAN backup registry history |

---

## ✅ Expected Output

- Backup files stored under `/opt/oracle/backups/full` and `/opt/oracle/backups/incremental`  
- RMAN log files in `output/`  
- JSON manifests for automation pipelines  
- Verified entries in `sys.rman_backup_registry`  

---

## 🧠 Notes

- You can schedule both scripts with **cron jobs**:
  ```bash
  0 2 * * 0 /path/to/full_backup.sh
  0 2 * * 1-6 /path/to/incremental_backup.sh

