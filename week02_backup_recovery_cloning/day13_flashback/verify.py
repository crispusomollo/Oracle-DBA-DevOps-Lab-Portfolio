#!/usr/bin/env python3
import os
import cx_Oracle

def check_rman_log(log_file):
    with open(log_file, "r") as f:
        content = f.read()
    return "Finished backup" in content

def check_datapump_log(log_file):
    with open(log_file, "r") as f:
        content = f.read()
    return "successfully completed" in content

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

if __name__ == "__main__":
    print("=== Backup Verification ===")
    if check_rman_log("./output/rman_log_$(date +%Y%m%d).log"):
        print("[✓] RMAN backup verified.")
    else:
        print("[✗] RMAN backup missing or failed.")

    if check_datapump_log("./output/datapump_log_$(date +%Y%m%d).log"):
        print("[✓] Data Pump export verified.")
    else:
        print("[✗] Data Pump export missing or failed.")

    if verify_flashback():
        print("[✓] Flashback is enabled and working.")
    else:
        print("[✗] Flashback not enabled.")

