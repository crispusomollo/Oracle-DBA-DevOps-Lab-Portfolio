# Day 11 – Oracle Data Pump Automation

## 🎯 Objective

Automate logical backups and restore operations using Oracle Data Pump.

---

## ⚙️ Steps

1. Run `export_schema.sh` to export the HR schema.
2. Run `import_schema.sh` to import it as HR_RESTORE.
3. Verify the import using `verify_import.py`.

---

## 📂 Files

| File | Description |
|------|--------------|
| `export_schema.sh` | Automates Data Pump export |
| `import_schema.sh` | Automates Data Pump import |
| `verify_import.py` | Confirms data integrity |
| `check_objects.sql` | Counts schema objects |
| `test_query.sql` | Verifies data relationships |

---

## ✅ Expected Output

- Export and import logs generated in `output/`
- HR_RESTORE schema contains identical data
- Verification confirms successful import

---

## 🧠 Notes

- Use Data Pump directory `DATA_PUMP_DIR`
- You can schedule exports via cron for nightly backups
- Combine with RMAN for hybrid backup strategies
- To test corruption handling, modify a dump file slightly and rerun import

