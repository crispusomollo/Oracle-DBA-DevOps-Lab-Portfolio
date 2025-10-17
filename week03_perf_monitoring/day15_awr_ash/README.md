# Day 15 – AWR & ASH Performance Reports Automation

## 🎯 Objective

Automate generation of Oracle AWR and ASH reports for performance tuning and workload monitoring.

---

## ⚙️ Steps

1. Run `generate_awr_ash.sh`
2. Script creates new AWR snapshot and generates:
   - AWR report (system-wide performance)
   - ASH report (session-level activity)
3. Reports are stored in `output/` folder.

---

## 📂 Files

| File | Description |
|------|--------------|
| `generate_awr_ash.sh` | Bash automation script |
| `create_awr_snapshots.sql` | Captures new snapshots |
| `generate_awr_report.sql` | Creates AWR HTML report |
| `generate_ash_report.sql` | Creates ASH HTML report |

---

## ✅ Expected Output

- HTML reports saved in `output/`
- Snapshot log in `output/snapshot_log.txt`
- Ready for review in a browser

---

## 🧠 Notes

- Run daily or hourly via cron for monitoring.
- AWR data comes from `SYS.WRH$` tables and provides historical trends.
- ASH focuses on active session sampling every second.

---

## 🧩 Example Command

```bash
./generate_awr_ash.sh
_
