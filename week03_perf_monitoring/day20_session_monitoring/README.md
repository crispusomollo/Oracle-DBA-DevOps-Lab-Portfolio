# Day 20 – AWR & SQL Tuning Advisor Automation

## 🎯 Objective

- Capture AWR snapshots before and after workload
- Generate AWR reports for performance baselining
- Identify top SQL statements from v$sql
- Run SQL Tuning Advisor automatically for recommendations

---

## ⚙️ Steps

1. Run `generate_awr_reports.sh`
2. View generated `awr_report_begin_end.html` in browser
3. Review `output/tuning_report.txt` and run `tuning_report_parser.py` to extract insights

---

## 📂 Files

| File | Purpose |
|------|----------|
| `generate_awr_reports.sh` | Full AWR and tuning automation |
| `sql_tuning_advisor.sql` | Executes tuning advisor for target SQL |
| `tuning_report_parser.py` | Extracts summary from tuning advisor |
| `sql/` | Contains workload creation, load, cleanup, and query SQLs |

---

## 🧩 Output

- `output/awr_report_begin_end.html`
- `output/top_sql_ids.log`
- `output/tuning_report.txt`

