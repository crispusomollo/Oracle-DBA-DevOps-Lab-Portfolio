# Day 17 – Indexing Strategies & Maintenance Automation

## 🎯 Objective

- Create and test B-tree, bitmap, and invisible indexes
- Automate index health analysis and rebuilds
- Verify index integrity and performance improvements

---

## ⚙️ Steps

1. Run `manage_indexes.sh` to create, analyze, and rebuild indexes  
2. Run `verify_indexes.py` to confirm index health and visibility  

---

## 📂 Files

| File | Description |
|------|--------------|
| `create_test_indexes.sql` | Creates sample indexes |
| `analyze_index_health.sql` | Checks fragmentation & stats |
| `rebuild_indexes.sql` | Rebuilds invalid indexes |
| `drop_test_indexes.sql` | Cleans up test objects |
| `manage_indexes.sh` | Main automation script |
| `verify_indexes.py` | Validates index status post-maintenance |

---

## 🧩 Output

- `index_health_before.log`
- `index_health_after.log`
- `rebuild_summary.txt`

---

## 💡 Notes

- Use **B-tree** for high-cardinality columns  
- Use **bitmap** for low-cardinality columns  
- Use **invisible indexes** for testing optimizer behavior without affecting plans  
- Schedule weekly index health checks via cron  


