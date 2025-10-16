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

