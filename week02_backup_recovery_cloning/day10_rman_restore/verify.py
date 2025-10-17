#!/usr/bin/env python3
import cx_Oracle

dsn = cx_Oracle.makedsn("localhost", 1521, service_name="FREEPDB1")

def verify_restore():
    print("=== RMAN Restore Verification ===")
    try:
        conn = cx_Oracle.connect("hr", "hr", dsn)
        cur = conn.cursor()
        cur.execute("SELECT COUNT(*) FROM employees")
        count = cur.fetchone()[0]
        print(f"[✓] HR.EMPLOYEES accessible, total rows: {count}")
        conn.close()
    except Exception as e:
        print("[✗] Verification failed:", e)

if __name__ == "__main__":
    verify_restore()

