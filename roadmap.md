# Oracle DBA Learning & Projects Roadmap

Welcome to the **Oracle DBA Learning & Project Roadmap** — a 45-day hands-on program designed to take you from basic DBA skills to real-world Oracle administration, automation, and cloud provisioning using tools like **Bash**, **Python**, **Terraform**, and **Oracle Cloud Infrastructure (OCI)**.

---

## 🎯 Objectives

By the end of this roadmap, you will:

- Be able to administer Oracle 23c databases confidently
- Automate key DBA tasks using Bash and Python
- Set up robust backup & recovery strategies with RMAN & Data Pump
- Monitor performance using AWR, ASH, and custom scripts
- Secure Oracle databases with auditing, roles, and encryption
- Provision cloud infrastructure using Terraform and OCI CLI
- Build real-world DBA projects

---

## 🛠️ Prerequisites

Before you begin, ensure the following:

- Oracle 23c Free installed (Docker or native)
- Linux OS (Oracle Linux, Ubuntu, or CentOS preferred)
- SQL Developer & SQL*Plus installed
- Listener configured and running (`lsnrctl status`)
- Environment variables set: `ORACLE_SID`, `ORACLE_HOME`, `PATH`
- Git installed and configured
- Bash and Python 3.x installed
- (Optional) Oracle Cloud Free Tier account + Terraform CLI

---

## 📁 Repository Structure

```text
Oracle-DBA-Learning-Roadmap/
│
├── week01_core_setup_user_mgmt/
│   ├── day01_env_setup/
│   │   ├── README.md
│   │   ├── run.sh
│   │   ├── verify.py
│   │   ├── sql/
│   │   └── output/
│   └── ...
│
├── week02_backup_recovery_cloning/
├── week03_perf_monitoring/
├── week04_automation_jobs_scripting/
├── week05_security_auditing/
├── week06_terraform_cloud/
├── week07_capstone_projects/
│   ├── capstone01_backup_pipeline/
│   ├── capstone02_oci_infra/
│   └── capstone03_monitoring_dashboard/
│
├── utils/
│   ├── templates/
│   ├── logs/
│   └── config_samples/
│
├── docs/
│   ├── architecture/
│   ├── performance_reports/
│   └── notes/
│
├── .gitignore
├── requirements.txt
└── README.md  ← You are here

```

---

## 🗺️ Oracle DBA Project Build Plan

### ⚙️ Phase 1: Environment Setup (Days 1–7)
**Goal:** Setup foundational tools and Git-based workflow

| Task | Description |
|------|-------------|
| Oracle 23c installed & running | Native or Docker-based setup |
| Listener verified | Confirm listener status and port |
| SQL Developer + SQL\*Plus access | Ensure client access to DB |
| Git project initialized | With README, `.gitignore`, `run.sh`, etc. |
| Bash scripting basics verified | Confirm scripts execute and handle env setup |
| Oracle users and tablespaces created | With setup SQL scripts |
| Backup strategy basics | RMAN and Data Pump foundations |

➡️ **Output:** Verified local Oracle dev setup, working Git repo, and reusable environment automation.


### 💾 Phase 2: Backup, Recovery & Cloning (Days 8–14)
**Goal:** Master RMAN, Data Pump, and backup automation

| Task | Description |
|------|-------------|
| RMAN setup | Full and incremental backups |
| Data Pump (`expdp`/`impdp`) | Logical export/import |
| Flashback DB + logs | Practice time-based recovery |
| Bash scripts | Automate backup/restore |
| Clone DB | Use scripts for DB duplication |

➡️ **Output:** Automated backup and restore process + recovery drills


### 🚀 Phase 3: Performance Monitoring & SQL Tuning (Days 15–21)
**Goal:** Analyze and optimize database performance

| Task | Description |
|------|-------------|
| AWR + ASH reports | Capture workload history |
| EXPLAIN PLAN + DBMS_XPLAN | Analyze query execution paths |
| Indexing and partitioning | Improve query performance |
| Wait events, session monitoring | Identify bottlenecks |
| Bash/Python tools | Automate performance insights |

➡️ **Output:** Scripts to capture and analyze DB performance + demonstrated tuning skills


### 🤖 Phase 4: Automation & Job Scheduling (Days 22–28)
**Goal:** Automate routine DBA tasks

| Task | Description |
|------|-------------|
| `DBMS_SCHEDULER` jobs | Scheduled task automation |
| Bash/Python automation | Automate routine admin tasks |
| Log monitoring & alerts | Trigger responses from logs |
| OEM basics *(optional)* | Oracle Enterprise Manager usage |
| Logging + email alerts | Custom alerting pipelines |

➡️ **Output:** A working automation layer for common DBA tasks


### 🔐 Phase 5: Security & Auditing (Days 29–35)
**Goal:** Secure the DB and track activity

| Task | Description |
|------|-------------|
| Oracle user policies | Password rules, lockout, expiry |
| Password complexity & roles | Role-based access control |
| Listener encryption | Secure listener with TCPS |
| Auditing & TDE | Track changes and protect data |
| Patching and compliance | Update and secure Oracle installations |

➡️ **Output:** A secured Oracle DB with automated audit and encryption enabled


### ☁️ Phase 6: Cloud, Terraform & OCI (Days 36–42)
**Goal:** Provision infrastructure in Oracle Cloud (OCI)

| Task | Description |
|------|-------------|
| Terraform basics | Write and run IaC scripts |
| OCI CLI usage | Automate cloud operations |
| Provision VCN, compute, DB | Full OCI environment |
| Cloud backup strategy | RMAN to Object Storage |
| Cloud metrics and monitoring | Track usage and performance |

➡️ **Output:** Infrastructure-as-Code (IaC) pipeline + OCI automation scripts


### 🧪 Phase 7: Capstone Projects (Days 43–45)
**Goal:** Apply all skills in practical mini-projects

| Project | Description |
|---------|-------------|
| Automated Backup Pipeline | Full backup + restore + logging |
| Terraform-based OCI Infrastructure | End-to-end cloud provisioning |
| Monitoring & Alerting Dashboard | Combine SQL, logs, scripts, and alerts |

➡️ **Output:** Final Git-tracked project showcasing the full Oracle DBA toolchain

---

## 🧱 Daily Deliverables

For each day or task, the following files are expected:

| File | Purpose |
|------|---------|
| `README.md` | Task description and why it matters |
| `run.sh` | Automates the setup or action |
| `verify.py` | Validates task success |
| `sql/setup.sql` | SQL used for provisioning/config |
| `output/` | Logs, screenshots, or outputs from the task |

---

🧠 **Tip:** Structure your repo by `weekXX_taskname/`, with one subfolder per task and the above files inside each.

Happy building! 💪

