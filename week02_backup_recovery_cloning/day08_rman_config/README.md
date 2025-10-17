# Day 8 – RMAN Configuration & Environment Setup

## 🎯 Objective

Set up Oracle RMAN environment, directories, and catalog user for backup and recovery automation.

---

## ⚙️ Steps

1. Run `run.sh` to initialize and verify RMAN setup.
2. Review `output/env_check.log` for setup status.
3. Confirm catalog user creation using `sql/test_rman_connection.sql`.

---

## 📂 Files

| File | Description |
|------|--------------|
| `create_rman_catalog_user.sql` | Creates and registers RMAN catalog user |
| `test_rman_connection.sql` | Tests RMAN connection |
| `run.sh` | Automates setup and verification |
| `validate_env.py` | Verifies environment configuration |

---

## ✅ Expected Output

- RMAN catalog user created successfully  
- Backup and archive directories validated  
- Environment variables confirmed  
- JSON status report generated  

---

## 🧠 Notes

- RMAN catalog is optional but highly recommended for large DBs.  
- Use `rman target / catalog rman/Rman#2025@FREEPDB1` to connect manually.  
- Ensure `/opt/oracle/backups` and `/opt/oracle/archivelog` are writable by Oracle user.

