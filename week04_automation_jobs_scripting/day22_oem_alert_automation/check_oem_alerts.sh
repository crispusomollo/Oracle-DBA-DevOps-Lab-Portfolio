#!/bin/bash
# ============================================================
# Oracle OEM Alert Retrieval and Notification Script
# ============================================================

DB_CONN="sys/Myles003@//localhost:1539/FREEPDB1 as sysdba"
OUT_DIR="./output"
mkdir -p $OUT_DIR

echo "=== Checking for OEM Alerts at $(date) ==="

# 1. Extract alerts from Oracle diagnostic views
sqlplus "$DB_CONN" @parse_alert_log.sql

# 2. Call Python notifier
python3 alert_notifier.py

echo "=== OEM Alert Scan Complete ==="

