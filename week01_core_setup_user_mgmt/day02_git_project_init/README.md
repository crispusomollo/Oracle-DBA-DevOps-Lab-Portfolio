# Day 3 – Oracle User Management Automation

## 🎯 Objective
Automate Oracle user creation, privilege assignment, and verification from Ubuntu using SQL*Plus and Python.

---

## ⚙️ Steps
1. Run `run.sh` to create and assign users and roles.
2. Use `verify_user.py` to confirm user existence and account status.
3. Review logs under `/output`.

---

## 📂 Files
| File | Description |
|------|--------------|
| `create_users.sql` | Creates users and tablespace |
| `grant_roles.sql` | Assigns custom roles |
| `drop_users.sql` | Cleans up old users and data |
| `run.sh` | Main automation script |
| `verify_user.py` | Python-based user verification |

---

## ✅ Expected Output
- Users `APP_USER` and `APP_DEV` created successfully  
- Tablespace `APP_DATA` exists  
- Custom role `APP_READ_ONLY` granted  

---

## 🧠 Tips
- Use this setup as a template for security audits and future Terraform provisioning.  
- Update `DB_CONN` and passwords as per your system setup.

