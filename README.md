<p align="center">
  <img src="https://img.shields.io/badge/Oracle%20DBA-Automation%20%7C%20Security%20%7C%20DevOps-blue?style=flat-square&logo=oracle" />
</p>

<h1 align="center"> Oracle DBA Lab — DevOps Edition</h1>

<p align="center">
  Built a 45-day hands-on Oracle DBA DevOps lab in Oracle DBA environments to level up on automation, security, and performance using <strong> Oracle 23c, Bash, Python, SQL, Linux and DevOps best practices.</strong> Packed with real-world challenges and ready to fork, tweak, and learn from. This lab showcases essential skills for database administration, automation, performance tuning, and cloud migration. Always growing and happy to collaborate!
</p>

<p align="center">
  <a href="https://github.com/crispusomollo/Oracle-DBA-DevOps-Lab-Portfolio">
    <img src="https://img.shields.io/github/last-commit/crispusomollo/Oracle-DBA-DevOps-Lab-Portfolio?style=flat-square" alt="Last Commit" />
  </a>
  <img src="https://img.shields.io/badge/Oracle-23c-F80000?style=flat-square&logo=oracle" alt="Oracle 23c" />
  <img src="https://img.shields.io/badge/Linux-Bash-2C2C2C?style=flat-square&logo=linux" alt="Linux & Bash" />
  <img src="https://img.shields.io/badge/Python-3.10-blue?style=flat-square&logo=python" alt="Python" />
  <img src="https://img.shields.io/badge/SQL-Structured%20Query%20Language-blue?style=flat-square&logo=postgresql" alt="SQL" />
  <img src="https://img.shields.io/badge/DevOps-Automation-yellowgreen?style=flat-square&logo=devops" alt="DevOps" />
</p>


---

## 🚀 Features

- 🧑‍💻 Multi-schema Oracle DB (e.g. `dev_user`, `analyst_user`)
- 💾 Automated backups via Bash + cron
- 🐚 Shell scripts for health checks, log analysis, space monitoring
- 📈 Performance insights using dynamic `V$` views
- ☁️ Portable with Docker Compose or deployable to Oracle Cloud ATP
- 🔐 OS + DB security hardening examples

---

## 🧪 Lab Preview

### Users

- `dev_user` – Developer schema with full object privileges  
- `analyst_user` – Read-only access to shared views and reports

### Sample Scripts

- `db_backup.sh` – Full export with `expdp`  
- `listener_check.sh` – Check Oracle listener status  
- `space_monitor.sh` – Tablespace alert script  
- `schema-create.sql` – Setup sample tables, users, and data

---

## 📦 Quick Start (Docker)

> 🐳 Run the full lab locally using Docker Compose.

```bash
git clone https://github.com/crispusomollo/oracle-lab-x.git
cd oracle-lab-x/docker
docker-compose up -d
```

## 🧠 Technologies

- Oracle 23c Free / XE
- Oracle Linux (WSL + Cloud)
- SQL\*Plus + SQL Developer
- Bash scripting
- Docker (optional)
- Terraform / OCI CLI (optional)

## 📂 Project Structure

See [lab-scripts/](./lab-scripts) and [docker/](./docker) for core files.

## 📸 Screenshots

<img width="1896" height="1063" alt="image" src="https://github.com/user-attachments/assets/c269308e-33a1-417e-a7d9-10d6eeffbc37" />

<img width="1902" height="1064" alt="image" src="https://github.com/user-attachments/assets/466afa25-bc84-47bc-9af9-376f74f64916" />

<img width="1868" height="986" alt="image" src="https://github.com/user-attachments/assets/bf67cb49-6a47-41c1-9211-505fe3d635bb" />

<img width="1899" height="1074" alt="image" src="https://github.com/user-attachments/assets/301a3825-70de-4ad2-8e13-1ed411344219" />


## 🎓 Skills Demonstrated
- ✅ Oracle user & schema administration
- ✅ Tablespace + quota management
- ✅ Data Pump exports (expdp) & imports (impdp)
- ✅ Bash scripting with cron, alerts, log rotation
- ✅ SQL tuning with V$SQL, V$SESSION, V$SYSTEM_EVENT
- ✅ Dockerized deployment + optional cloud migration


🗺️ Overall Plan: Oracle DBA Project Build

⚙️ Phase 1: Environment & Project Initialization (Days 1–7)

| Goal | Setup foundational tools and Git-based workflow |
| Tasks |

Oracle 23c installed & running (Docker or native)

Listener verified

SQL Developer + SQL*Plus access

Git project initialized

Bash scripting basics verified

Oracle users and tablespaces created

Backup strategy basics

➡️ Output: Verified local Oracle dev setup, working Git repo, and environment automation.


💾 Phase 2: Backup, Recovery & Cloning (Days 8–14)

| Goal | Master RMAN, Data Pump, and backup automation |
| Tasks |

RMAN setup, backup and restore

Data Pump expdp/impdp

Flashback DB + logs

Bash scripts for automated backups

Clone a DB using scripts

➡️ Output: Automated backup and restore process + recovery drills


🚀 Phase 3: Performance Monitoring & SQL Tuning (Days 15–21)

| Goal | Analyze and optimize performance |
| Tasks |

AWR + ASH reports

EXPLAIN PLAN + DBMS_XPLAN

Indexing and partitioning

Wait events, session monitoring

Bash/Python performance monitoring


➡️ Output: Scripts to capture and analyze DB performance + tuning skills

🤖 Phase 4: Automation & Job Scheduling (Days 22–28)

| Goal | Automate routine DBA tasks |
| Tasks |

DBMS_SCHEDULER jobs

Bash/Python automation

Log monitoring and alerts

OEM basics (optional)

Logging + email alerts


➡️ Output: A working automation layer for DBA tasks

🔐 Phase 5: Security & Auditing (Days 29–35)

| Goal | Secure the DB and track activity |
| Tasks |

Oracle user policies

Password complexity & roles

Listener encryption

Auditing and TDE

Patching and compliance

➡️ Output: A secured Oracle DB with automated audit logging


☁️ Phase 6: Cloud, Terraform & OCI (Days 36–42)

| Goal | Provision infrastructure in Oracle Cloud (OCI) |
| Tasks |

Terraform basics

OCI CLI usage

Provision VCN, compute, DB

Cloud backup strategy

Cloud metrics and monitoring

➡️ Output: Infrastructure-as-Code (IaC) pipeline + OCI automation scripts


🧪 Phase 7: Capstone Projects (Days 43–45)

| Goal | Apply all skills in mini-projects |

| Projects |

Automated Backup Pipeline

Terraform-based OCI Infrastructure

Monitoring & Alerting Dashboard

➡️ Output: Final Git-tracked project showcasing everything you’ve learned

---

🧱 Daily Deliverables

For every single day, you get:
File	Description
README.md	What to do, why it matters
run.sh	Automates the task
verify.py	Validates success
sql/setup.sql	SQL for provisioning or config
output/	Logs of what happened

---

## 💡 Future Improvements
 - GitHub Actions for nightly script testing
 - Terraform template for full OCI IaaS + ATP setup
 - Blog post walkthrough or YouTube video
 - SQL query challenge workbook
 
## 🗺️ Learning Roadmap
 [roadmap.md](roadmap.md) – 45-day learning + build plan

## License

This project is licensed under the [MIT License](./LICENSE), a permissive open source license that allows you to freely use, modify, and distribute the code.

It comes without warranty, so use it at your own risk.

If you plan to contribute or use the code in your projects, please review the LICENSE file for details.

## 🙌 Contributing / Feedback
Contributions welcome!
Fork, star, suggest improvements, or open issues

---

