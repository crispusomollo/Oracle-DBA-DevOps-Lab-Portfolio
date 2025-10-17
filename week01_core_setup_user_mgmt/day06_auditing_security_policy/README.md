# Day 6 – Auditing & Security Policy Automation

## 🎯 Objective

Automate Oracle Unified Auditing setup for user actions and object access, verifying configurations and recent logs.

---

## ⚙️ Steps

1. Run `run.sh` to enable auditing and create custom policies.
2. Trigger actions as `app_user` or `app_dev` to generate logs.
3. Run `verify_audit_logs.py` to confirm policy and audit entries.
4. Review outputs in `/output`.

---

## 📂 Files

| File | Description |
|------|--------------|
| `enable_auditing.sql` | Enables global auditing |
| `create_audit_policies.sql` | Creates and enables user-level audit policies |
| `disable_auditing.sql` | Disables audit policies |
| `drop_audit_policies.sql` | Drops policies for reset |
| `run.sh` | Automates the entire process |
| `verify_audit_logs.py` | Verifies audit setup and recent events |

---

## ✅ Expected Output

- Unified Auditing enabled  
- Custom audit policies created for `APP_USER` and `APP_DEV`  
- Recent activity logged in `UNIFIED_AUDIT_TRAIL`  
- Verification script confirms audit entries  

---

## 🧠 Notes

- You can later schedule this verification script in **cron** for daily compliance checks.  
- In Week 2, we’ll export audit logs to a **SIEM-compatible JSON format** for integration.  

