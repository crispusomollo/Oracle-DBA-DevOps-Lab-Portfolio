#!/bin/bash
echo "[*] Starting daily monitoring..."
bash check_logs.sh
bash disk_usage.sh | tee -a ./output/monitor_log.txt
python3 monitor_db.py
python3 report_generator.py
echo "[+] Monitoring & reporting completed."

