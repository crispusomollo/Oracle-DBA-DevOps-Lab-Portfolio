# Day 25 – Monitoring & Reporting (Bash + Python)

## 🎯 Objective

- Monitor Oracle job and backup automation health.

- Collect and visualize metrics: log size, backup success, disk usage, and DB uptime.

- Send automated email alerts for failed jobs or anomalies.

- Generate daily summary reports (HTML/text) for the DBA inbox or dashboard


## 🔧 Tasks

- Run `run.sh` to execute automation
- Use `verify.py` to validate task success


## 📊 Expected Output

✅ Daily monitoring log (output/monitor_log.txt) updated automatically.
✅ HTML report (output/daily_report.html) generated daily.
✅ Email alerts sent when any failure is detected.
✅ Ready for integration into Grafana or Jenkins pipeline later.


## 📝 Notes

- Implement log health checks for cron jobs and scripts.

- Monitor database uptime and tablespace utilization using Python and SQL.

- Schedule automated reports via cron.

- Generate summary dashboards that can later integrate with Grafana or Prometheus exporters.



⚙️  Folder Structure

Oracle-DBA-DevOps-Lab/
└── week04_automation_jobs_scripting/
    └── day25_monitoring_reporting/
        ├── README.md
        ├── run.sh
        ├── sql/
        │   ├── check_uptime.sql
        │   └── tablespace_usage.sql
        ├── python/
        │   ├── monitor_db.py
        │   └── report_generator.py
        ├── bash/
        │   ├── check_logs.sh
        │   ├── disk_usage.sh
        │   └── email_alert.sh
        ├── output/
        │   ├── daily_report.html
        │   └── monitor_log.txt
        └── cron/
            └── monitoring.cron

