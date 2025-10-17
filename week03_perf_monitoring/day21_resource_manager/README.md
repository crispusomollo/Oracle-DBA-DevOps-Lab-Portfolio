# Day 21 – Real-Time SQL Monitoring & Lock Analysis Dashboard

## 🎯 Objectives
- Monitor active SQL sessions in real time
- Detect blocking locks and long-running queries
- Display session stats in a colorized terminal dashboard
- Log all activity snapshots for later analysis

---

## ⚙️ Steps
1. Run `./monitor_sql_activity.sh`
2. The dashboard auto-refreshes every 60 seconds
3. JSON logs are saved in `output/logs/`
4. Stop the monitor anytime with `CTRL + C`

---

## 📂 Output
| File | Description |
|------|--------------|
| `active_sessions.json` | List of active SQL sessions |
| `blocking_sessions.json` | Details of blocked sessions |
| `dashboard.py` | Python terminal dashboard |
| `logs/` | Timestamped snapshots for each refresh |

---

## Notes

Install dependency:

pip install rich


Run once:

python3 dashboard.py


Or continuously:

./monitor_sql_activity.sh


