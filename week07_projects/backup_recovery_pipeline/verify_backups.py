#!/usr/bin/env python3
import os
import cx_Oracle
from datetime import datetime

# -------------------------
# CONFIGURATION
# -------------------------
LOG_DIR = os.path.expanduser("~/oracle-backup/output")  # Update to your actual output folder
LOG_DATE = datetime.now().strftime("%Y%m%d")
RMAN_LOG = os.path.join(LOG_DIR, f"rman_log_{LOG_DATE}.log")
DATAPUMP_LOG = os.path.join(LOG_DIR, f"datapump_log_{LOG_DATE}.log")

# -------------------------
# LOG CHECK FUNCTIONS
# -------------------------
def check_log(log_file, keyword):
    if os.path.exists(log_file):
        with open(log_file, "r") as f:
            content = f.read()
        return keyword in content
    return False

# -------------------------
# FLASHBACK VERIFICATION
# -------------------------
def verify_flashback():
    try:
        conn = cx_Oracle.connect("sys/Myles003@//localhost:1539/FREEPDB1", mode=cx_Oracle.SYSDBA)
        cur = conn.cursor()
        cur.execute("SELECT FLASHBACK_ON FROM V$DATABASE")
        status = cur.fetchone()[0]
        conn.close()
        return status == "YES"
    except Exception as e:
        print("[✗] Flashback verification failed:", e)
        return False

# -------------------------
# MAIN
# -------------------------
if __name__ == "__main__":
    print("=== Backup Verification Report ===")
    print("Date:", datetime.now())

    if check_log(RMAN_LOG, "Finished backup"):
        print("[✓] RMAN backup verified.")
    else:
        print("[✗] RMAN log not found or backup failed.")

    if check_log(DATAPUMP_LOG, "successfully completed"):
        print("[✓] Data Pump export verified.")
    else:
        print("[✗] Data Pump log not found or export failed.")

    if verify_flashback():
        print("[✓] Flashback is enabled and operational.")
    else:
        print("[✗] Flashback not enabled.")

