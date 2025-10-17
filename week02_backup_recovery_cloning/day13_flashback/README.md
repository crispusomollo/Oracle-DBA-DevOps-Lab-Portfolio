# Day 13 – Flashback & RMAN + Data Pump Integration Workflow

## 🎯 Objective

Integrate RMAN physical backups, Data Pump logical exports, and Flashback technologies into a unified backup automation pipeline.

---

## ⚙️ Steps

1. Enable Flashback using `sql/enable_flashback.sql`
2. Run `backup_pipeline.sh` to perform full backup
3. Verify using `verify_backup.py`

---

## 📂 Files

| File | Description |
|------|--------------|
| `enable_flashback.sql` | Enables Flashback and FRA |
| `backup_pipeline.sh` | Automates RMAN + Data Pump backups |
| `verify_backup.py` | Validates backup success and flashback state |
| `datapump_expdp.par` | Parameter file for HR schema export |

---

## ✅ Expected Output

- Flashback enabled (`FLASHBACK_ON = YES`)
- RMAN compressed backup successful
- Data Pump export completed
- Verification passes for all components

---

## 🧠 Notes

- Flashback enables fast database point-in-time recovery
- Data Pump complements RMAN for schema-level restore
- Combine with `cron` or `DBMS_SCHEDULER` for nightly backups
- You can extend this to upload `.bkp` files to OCI later (Week 6)

