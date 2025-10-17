# Day 18 – Table Partitioning & Query Performance Automation

## 🎯 Objective

- Implement Range, List, and Hash partitioning
- Automate partition creation and data insertion
- Measure performance improvements
- Dynamically manage new partitions

---

## ⚙️ Steps

1. Run `partition_automation.sh`  
2. Analyze logs under `output/`  
3. Run `compare_performance.py` to view execution time comparisons  

---

## 📂 Files

| File | Description |
|------|--------------|
| `create_partitioned_tables.sql` | Creates partitioned tables |
| `insert_sample_data.sql` | Inserts test data |
| `query_performance_test.sql` | Runs benchmark queries |
| `add_partition.sql` | Adds new partitions dynamically |
| `drop_partitioned_tables.sql` | Cleans up |
| `partition_automation.sh` | Orchestrates the workflow |
| `compare_performance.py` | Measures query time for each partition type |

---

## 🧩 Output

- `query_performance_before.log`
- `query_performance_after.log`
- `partition_summary.txt`

---

## 💡 Notes

- **Range partition** → by time-based column  
- **List partition** → by region/category  
- **Hash partition** → for even data distribution  
- Schedule partition management via **cron** for monthly data  

---

## ✅ Git Commit

```bash
git add .
git commit -m "[W03][D18] Implemented Oracle table partitioning and automated performance testing"

