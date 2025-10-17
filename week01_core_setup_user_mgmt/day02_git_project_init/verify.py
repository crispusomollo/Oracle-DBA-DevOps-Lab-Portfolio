#!/bin/bash
LOG="./output/repo_check_log.txt"
echo "=== Repo Verification Log: $(date) ===" > $LOG

echo "[*] Checking Git status..." | tee -a $LOG
git status >> $LOG

echo "[*] Checking folder structure..." | tee -a $LOG
find . -type d | tee -a $LOG

echo "[*] Checking for missing README.md files..." | tee -a $LOG
find . -type f -name "README.md" | tee -a $LOG

echo "[+] Repo verification complete. Log saved to $LOG"
