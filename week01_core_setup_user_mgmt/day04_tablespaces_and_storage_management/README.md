# Day 4 – Tablespaces & Storage Management Automation

## 🎯 Objective
Automate tablespace creation, resizing, and quota assignment from Ubuntu using Bash and SQL*Plus, with verification via Python.

---

## ⚙️ Steps
1. Run `run.sh` to create and configure tablespaces.
2. Execute `verify_tablespace.py` to confirm tablespace and quota setup.
3. Review logs under `/output`.

---

## 📂 Files
| File | Description |
|------|--------------|
| `create_tablespaces.sql` | Creates data and index tablespaces |
| `resize_tablespace.sql` | Resizes existing datafiles |
| `assign_quotas.sql` | Assigns user quotas |
| `drop_tablespaces.sql` | Cleans up tablespaces |
| `run.sh` | Automates all tablespace tasks |
| `verify_tablespace.py` | Confirms tablespace and quota setup |

---

## ✅ Expected Output
- Tablespaces `APP_DATA` and `APP_INDEX` created and autoextending  
- Users `APP_USER` and `APP_DEV` assigned quotas  
- Logs stored in `/output/`

---

## 🧠 Tips
- Use this setup for monitoring storage trends and integrating alerts (we’ll automate alerts in Week 4).  
- Consider linking this with RMAN backup verification scripts later.

