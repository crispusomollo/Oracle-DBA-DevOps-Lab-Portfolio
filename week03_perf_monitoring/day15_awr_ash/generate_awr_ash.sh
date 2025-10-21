#!/bin/bash
# ============================================================
# Automate AWR & ASH Performance Report Generation
# ============================================================

DB_CONN="sys/Myles003@//localhost:1539/FREEPDB1 as sysdba"
LOG_DATE=$(date +%Y%m%d_%H%M)
OUT_DIR="./output"

mkdir -p $OUT_DIR
cd $OUT_DIR

echo "=== Generating AWR and ASH Reports: $(date) ==="

# 1. Create new AWR snapshot
echo "[*] Creating AWR snapshot..."
sqlplus -s "$DB_CONN" @../sql/create_awr_snapshots.sql | tee snapshot_log.txt

# 2. Extract latest snapshot IDs
BEGIN_SNAP=$(grep -oE "[0-9]{5,}" snapshot_log.txt | head -n 2 | tail -n 1)
END_SNAP=$(grep -oE "[0-9]{5,}" snapshot_log.txt | head -n 1)

echo "[i] Using snapshots: Begin=$BEGIN_SNAP, End=$END_SNAP"

# 3. Generate AWR report
AWR_REPORT="awr_report_${LOG_DATE}.html"
sqlplus -s "$DB_CONN" @../sql/generate_awr_report.sql $BEGIN_SNAP $END_SNAP $AWR_REPORT

# 4. Generate ASH report
ASH_REPORT="ash_report_${LOG_DATE}.html"
sqlplus -s "$DB_CONN" @../sql/generate_ash_report.sql $ASH_REPORT

# 5. Completion summary
echo "---------------------------------------"
echo "[✓] AWR Report: $OUT_DIR/$AWR_REPORT"
echo "[✓] ASH Report: $OUT_DIR/$ASH_REPORT"
echo "=== Reports generated successfully ==="

