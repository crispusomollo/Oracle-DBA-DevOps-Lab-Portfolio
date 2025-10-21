#!/bin/bash
# ============================================================
# Generate AWR report & run SQL Tuning Advisor automation
# ============================================================

DB_CONN="sys/Myles003@//localhost:1539/FREEPDB1 as sysdba"
OUT_DIR="./output"
mkdir -p $OUT_DIR

echo "=== AWR & SQL Tuning Automation Started ==="

# 1. Create workload
echo "[*] Creating workload..."
sqlplus "$DB_CONN" @sql/create_workload.sql

# 2. Take starting AWR snapshot
BEGIN_SNAP=$(sqlplus "$DB_CONN" <<EOF
SET PAGESIZE 0 FEEDBACK OFF VERIFY OFF HEADING OFF ECHO OFF
SELECT MAX(snap_id) FROM dba_hist_snapshot;
EXIT;
EOF
)
echo "[+] Begin Snapshot ID: $BEGIN_SNAP"

# 3. Run load
echo "[*] Running workload..."
sqlplus "$DB_CONN" @sql/run_load.sql

# 4. Take ending snapshot
END_SNAP=$(sqlplus "$DB_CONN" <<EOF
SET PAGESIZE 0 FEEDBACK OFF VERIFY OFF HEADING OFF ECHO OFF
SELECT MAX(snap_id) FROM dba_hist_snapshot;
EXIT;
EOF
)
echo "[+] End Snapshot ID: $END_SNAP"

# 5. Generate AWR report
echo "[*] Generating AWR report..."
sqlplus "$DB_CONN" <<EOF
@?/rdbms/admin/awrrpt.sql
html
${BEGIN_SNAP}
${END_SNAP}
$OUT_DIR/awr_report_begin_end.html
EOF

# 6. Identify top SQL IDs
echo "[*] Extracting top SQL IDs..."
sqlplus "$DB_CONN" @sql/get_sql_ids.sql

TOP_SQL=$(head -2 $OUT_DIR/top_sql_ids.log | tail -1 | awk '{print $1}')
echo "[+] Target SQL ID: $TOP_SQL"

# 7. Run SQL Tuning Advisor
echo "[*] Running SQL Tuning Advisor..."
sqlplus "$DB_CONN" @sql_tuning_advisor.sql $TOP_SQL | tee $OUT_DIR/tuning_report.txt

echo "[✓] Reports generated in $OUT_DIR/"
echo "=== AWR & SQL Tuning Completed ==="

