# Day 7 – Backup Verification Automation (RMAN Simulation)

## 🎯 Objective

Automate the backup verification workflow using Bash and Python before implementing actual RMAN commands.

---

## ⚙️ Steps

1. Run `run.sh` to simulate backup creation and registration.
2. Verify results using `verify_backup.py`.
3. Check the `output/` directory for logs and manifest files.

---

## 📂 Files

| File | Description |
|------|--------------|
| `create_backup_dir.sql` | Creates Oracle directory object for backups |
| `register_backup.sql` | Inserts simulated backup record |
| `check_backup_status.sql` | Queries backup registry |
| `run.sh` | Automates simulation |
| `verify_backup.py` | Validates DB entries and manifest |

---

## ✅ Expected Output

- Oracle directory object for backups created  
- Simulated `.bak` file generated  
- Backup record registered in `sys.backup_registry`  
- Manifest file created and validated  

---

## 🧠 Notes

- Replace simulation with **RMAN scripts** in Week 2.  
- Use cron jobs later for daily automatic verification.  
- Manifest files can be uploaded to **OCI Object Storage** for audit tracking.

