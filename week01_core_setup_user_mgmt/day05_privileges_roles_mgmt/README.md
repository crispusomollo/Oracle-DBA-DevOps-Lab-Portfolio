# Day 5 – Privileges & Roles Automation

## 🎯 Objective
Automate creation and assignment of Oracle roles and privileges using SQL*Plus from Ubuntu, verified via cx_Oracle Python script.

---

## ⚙️ Steps
1. Run `run.sh` to create and configure roles and privileges.
2. Execute `verify_privileges.py` to confirm assignments.
3. Check logs in `/output`.

---

## 📂 Files
| File | Description |
|------|--------------|
| `create_roles.sql` | Creates custom roles |
| `grant_privileges.sql` | Grants privileges and assigns roles |
| `revoke_privileges.sql` | Revokes roles and privileges |
| `drop_roles.sql` | Drops roles |
| `run.sh` | Automates all operations |
| `verify_privileges.py` | Verifies roles and privilege assignments |

---

## ✅ Expected Output
- Roles `APP_READONLY` and `APP_DEVOPS` created  
- Users `APP_USER` and `APP_DEV` granted appropriate privileges  
- Verification shows privileges and roles correctly applied  

---

## 🧠 Notes
- You can later integrate this with **CI/CD pre-deploy checks** to confirm DB users have correct roles before schema updates.  
- In Week 2, we’ll link this with **Data Pump exports** and **backup policies** for RBAC enforcement.

