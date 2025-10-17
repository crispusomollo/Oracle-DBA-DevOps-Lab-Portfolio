#!/bin/bash
# ============================================================
# Automate Oracle SQL plan analysis and baseline capture
# ============================================================

DB_CONN="sys/YourSysPassword@//localhost:1521/FREE as sysdba"
OUT_DIR="./output"
mkdir -p $OUT_DIR

echo "=== SQL Plan Baseline Analysis Started ==="

# 1. Create test table
echo "[*] Creating test table..."
sqlplus -s "$DB_CONN" @sql/create_test_table.sql

# 2. Run baseline & optimized queries
echo "[*] Running queries..."
sqlplus -s "$DB_CONN" @sql/run_queries.sql

# 3. Capture plan baselines
echo "[*] Capturing plan baselines..."
sqlplus -s "$DB_CONN" @sql/gather_plan_baseline.sql

# 4. Display captured baselines
echo "[*] Showing SQL plan baselines..."
sqlplus -s "$DB_CONN" @sql/show_baselines.sql > $OUT_DIR/plan_comparison.txt

echo "=== SQL Plan Analysis Completed ==="
echo "[✓] Plan Before: $OUT_DIR/plan_before.log"
echo "[✓] Plan After:  $OUT_DIR/plan_after.log"
echo "[✓] Summary:     $OUT_DIR/plan_comparison.txt"

