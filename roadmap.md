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



## 🗺️ Overall Plan: Oracle DBA Project Build
### ⚙️ Phase 1:
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


### 💾 Phase 2: Backup, Recovery & Cloning (Days 8–14)

| Goal | Master RMAN, Data Pump, and backup automation |
| Tasks |

RMAN setup, backup and restore

Data Pump expdp/impdp

Flashback DB + logs

Bash scripts for automated backups

Clone a DB using scripts

➡️ Output: Automated backup and restore process + recovery drills


### 🚀 Phase 3: Performance Monitoring & SQL Tuning (Days 15–21)

| Goal | Analyze and optimize performance |
| Tasks |

AWR + ASH reports

EXPLAIN PLAN + DBMS_XPLAN

Indexing and partitioning

Wait events, session monitoring

Bash/Python performance monitoring

➡️ Output: Scripts to capture and analyze DB performance + tuning skills


### 🤖 Phase 4: Automation & Job Scheduling (Days 22–28)

| Goal | Automate routine DBA tasks |
| Tasks |

DBMS_SCHEDULER jobs

Bash/Python automation

Log monitoring and alerts

OEM basics (optional)

Logging + email alerts

➡️ Output: A working automation layer for DBA tasks


### 🔐 Phase 5: Security & Auditing (Days 29–35)

| Goal | Secure the DB and track activity |
| Tasks |

Oracle user policies

Password complexity & roles

Listener encryption

Auditing and TDE

Patching and compliance

➡️ Output: A secured Oracle DB with automated audit logging


### ☁️ Phase 6: Cloud, Terraform & OCI (Days 36–42)

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


🧱 Daily Deliverables

For every single day, you get:

File	Description
README.md	What to do, why it matters
run.sh	Automates the task
verify.py	Validates success
sql/setup.sql	SQL for provisioning or config
output/	Logs of what happened
