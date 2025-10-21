# Day 26 – OEM Integration & Alert Automation

## 🎯 Objectives

- Retrieve and monitor critical alerts via Oracle diagnostic views
- Automate incident notification and escalation
- Simulate OEM alerting behavior in DevOps-style pipelines

---

## ⚙️ Steps

1. Run `./check_oem_alerts.sh`
2. Script fetches alerts (from v$diag_alert_ext or local log)
3. Alerts displayed on terminal via Rich console
4. Notifications appended to `output/notifications.log`
5. (Optional) Email notifications simulated

---

## 📂 Output

| File | Purpose |
|------|----------|
| `alerts.json` | Extracted Oracle alerts |
| `notifications.log` | Logged alert notifications |
| `alert_log_sample.log` | Sample for simulation |
| `check_oem_alerts.sh` | Master script |
| `alert_notifier.py` | Alert parser and notifier |

---
