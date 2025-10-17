# Day 14 – Backup Verification & Log Analysis Automation

## 🎯 Objective

Automate log parsing, verification, and reporting for Oracle backups (RMAN, Data Pump, Flashback).

---

## ⚙️ Steps

1. Run `verify_backups.sh` to analyze RMAN and Data Pump logs.
2. `parse_logs.py` parses logs for ORA errors or corruption messages.
3. `email_alert.py` (optional) sends the report to the admin.

---

## 📂 Files

| File | Description |
|------|--------------|
| `verify_backups.sh` | Main automation script |
| `parse_logs.py` | Parses and summarizes log health |
| `email_alert.py` | Sends email alerts (optional) |
| `check_rman_catalog.sql` | Lists recent backup sets |

---

## ✅ Expected Output

- Consolidated log report saved in `output/backup_status_report_YYYYMMDD.log`
- Python summary showing which logs are clean or contain errors
- Optional email alert sent for failed backups

---

## 🧠 Notes

- Integrate this with cron for daily runs:
  ```bash
  0 6 * * * /path/to/verify_backups.sh

python3 email_alert.py >> $REPORT 2>&1

