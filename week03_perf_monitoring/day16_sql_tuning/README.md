# Day 16 – SQL Tuning & Performance Visualization Dashboard

## 🎯 Objective
- Extract Oracle AWR data for recent snapshots
- Identify top SQL statements by CPU and elapsed time
- Visualize CPU trends and top SQLs using Python

---

## ⚙️ Steps
1. Run SQL scripts to export AWR data to CSV files:
   ```bash
   sqlplus -s sys/YourSysPassword@//localhost:1521/FREE as sysdba @sql/top_sqls.sql
```

2. Run Python visualizer:
```python
python3 analyze_perf.py
```

📊 Output

top_sqls.csv: Top SQLs by CPU

system_metrics.csv: System performance averages

wait_events.csv: Top 10 wait events

sql_top5.png: Top SQL CPU chart

cpu_trend.png: CPU metric chart


🧠 Notes

Use results to focus SQL tuning efforts on top resource consumers.

Combine with AWR/ASH automation (Day 15) for a full monitoring suite.

Optional: Integrate graphs into a Flask or Grafana dashboard later.

---

Run the Workflow:

1. Extract the performance data:

sqlplus -s sys/YourSysPassword@//localhost:1521/FREE as sysdba @sql/top_sqls.sql
sqlplus -s sys/YourSysPassword@//localhost:1521/FREE as sysdba @sql/system_metrics.sql
sqlplus -s sys/YourSysPassword@//localhost:1521/FREE as sysdba @sql/wait_events.sql


2. Run the Python visualizer:

python3 analyze_perf.py


3. Open the generated images:

xdg-open output/sql_top5.png
xdg-open output/cpu_trend.png


