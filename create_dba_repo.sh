#!/bin/bash

REPO_NAME="Oracle-DBA-DevOps-Lab"
BASE_DIR="$PWD/$REPO_NAME"

# Create base repo folder
mkdir -p "$BASE_DIR"
cd "$BASE_DIR" || exit

# Initialize Git
git init

# Create top-level files
cat > README.md <<EOF
# Oracle DBA Learning & Projects Roadmap

This repository tracks a 45-day Oracle DBA learning program with automation, scripting, and cloud integration.

## 📁 Structure

Each day includes:
- \`README.md\`: Task description and objectives
- \`run.sh\`: Automation script
- \`verify.py\`: Verification script
- \`sql/\`: Supporting SQL scripts
- \`output/\`: Logs or outputs
EOF

cat > .gitignore <<EOF
*.log
*.trc
*.trm
*.dmp
*.bak
*.gz
*.zip
__pycache__/
*.pyc
.env
.terraform/
*.tfstate
*.tfvars
.DS_Store
EOF

echo "cx_Oracle" > requirements.txt

# Create utility folders
mkdir -p utils/{templates,logs,config_samples}
mkdir -p docs/{architecture,performance_reports,notes}

# Function to create a day folder with starter files
create_day_folder() {
    local week=$1
    local day=$2
    local day_name=$3

    local path="$BASE_DIR/$week/day${day}_${day_name}"
    mkdir -p "$path/sql" "$path/output"

    cat > "$path/README.md" <<EOF
# Day $day: ${day_name//_/ }

## 🎯 Objective
_TODO: Describe objectives for this day._

## 🔧 Tasks
- Run \`run.sh\` to execute automation
- Use \`verify.py\` to validate task success

## 📝 Notes
_TODO: Add manual steps or observations._
EOF

    cat > "$path/run.sh" <<'EOF'
#!/bin/bash
echo "[*] Running automation for Day ..."
# TODO: Add SQL or Bash commands
EOF
    chmod +x "$path/run.sh"

    cat > "$path/verify.py" <<'EOF'
# TODO: Add Python logic to verify task success
def main():
    print("[*] Verification not yet implemented.")

if __name__ == "__main__":
    main()
EOF

    touch "$path/sql/setup.sql"
}

# Define weekly tasks (abbreviated names)
declare -A weeks
weeks=(
    [week01_core_setup_user_mgmt]="env_setup git_project_init sqlplus_sqldeveloper user_mgmt tablespaces_roles privileges_roles multitenant_setup"
    [week02_backup_recovery_cloning]="rman_config rman_backup rman_restore datapump db_cloning flashback verify_backups"
    [week03_perf_monitoring]="awr_ash sql_tuning indexing partitioning wait_events session_monitoring resource_manager"
    [week04_automation_jobs_scripting]="dbms_scheduler bash_scripting python_scripting alerts_logs oem_config log_audit license_awareness"
    [week05_security_auditing]="security_basics auditing listener_security tde_encryption data_masking archiving patching"
    [week06_terraform_cloud]="terraform_basics oci_compute_vcn oci_db_provision cloud_backup cloud_monitor terraform_modules"
)

# Build weekly structure
day=1
for week in "${!weeks[@]}"; do
    mkdir -p "$BASE_DIR/$week"
    IFS=' ' read -r -a tasks <<< "${weeks[$week]}"
    for task in "${tasks[@]}"; do
        create_day_folder "$week" "$day" "$task"
        day=$((day + 1))
    done
done

# Capstone Projects
mkdir -p "$BASE_DIR/week07_capstone_projects/capstone01_backup_pipeline/sql"
mkdir -p "$BASE_DIR/week07_capstone_projects/capstone02_oci_infra/sql"
mkdir -p "$BASE_DIR/week07_capstone_projects/capstone03_monitoring_dashboard/sql"

echo "[✓] Oracle DBA project structure created at $BASE_DIR"

