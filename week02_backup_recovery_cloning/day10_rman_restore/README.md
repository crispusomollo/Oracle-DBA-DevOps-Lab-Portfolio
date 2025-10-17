# Day 10 – RMAN Restore & Recovery (Media Failure Simulation)

## 🎯 Objective

Simulate a datafile failure and use RMAN to restore and recover the database automatically.

---

## ⚙️ Steps

1. Run `simulate_failure.sh` to rename a datafile.
2. Run `restore_recovery.sh` to perform RMAN restore & recovery.
3. Run `verify_restore.py` to confirm HR schema data access.

---

## 📂 Files

| File | Description |
|------|--------------|
| `simulate_failure.sh` | Simulates a datafile failure |
| `restore_recovery.sh` | Automates RMAN restore and recovery |
| `check_datafiles.sql` | Verifies datafile status |
| `verify_restore.py` | Confirms recovery by checking HR schema |

---

## ✅ Expected Output

- Renamed/missing datafile simulates media failure  
- RMAN restores and recovers successfully  
- Datafile status shows `ONLINE`  
- HR.EMPLOYEES query executes successfully  

---

## 🧠 Notes

- Use the backup from **Day 9** for restore source  
- Recovery logs are stored in `output/`  
- You can simulate additional scenarios (controlfile loss, redo corruption) later  
- For real-world workflows, integrate this script into cron or Ansible  

