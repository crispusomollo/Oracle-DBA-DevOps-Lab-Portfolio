# Day 19 – SQL Plan Baselines, Hints & Execution Plan Automation

## 🎯 Objective

- Learn how the optimizer chooses execution plans  
- Use hints to influence query paths  
- Capture and compare SQL plan baselines  
- Automate plan collection and performance analysis  

---

## ⚙️ Steps

1. Run `analyze_execution_plan.sh` to create test data and capture plans  
2. Check logs under `output/`  
3. Run `compare_plans.py` for automatic performance improvement summary  

---

## 📂 Files

| File | Description |
|------|--------------|
| `create_test_table.sql` | Creates and populates test data |
| `run_queries.sql` | Runs baseline & optimized queries |
| `gather_plan_baseline.sql` | Captures SQL plan baselines |
| `show_baselines.sql` | Displays saved plan baselines |
| `analyze_execution_plan.sh` | Automates all steps |
| `compare_plans.py` | Compares costs before & after optimization |

---

## 🧩 Output

- `plan_before.log`
- `plan_after.log`
- `plan_comparison.txt`

---

## 💡 Notes

- Use **SQL hints** for testing optimizer decisions (`INDEX`, `FULL`, `PARALLEL`)  
- Use **DBMS_SPM** to manage plan baselines for query stability  
- Regularly capture and verify plan performance in production environments  


