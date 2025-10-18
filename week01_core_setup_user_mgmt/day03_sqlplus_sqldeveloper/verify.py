#!/usr/bin/env python3
import cx_Oracle
import sys

dsn = cx_Oracle.makedsn("localhost", 1539, service_name="FREEPDB1")

def verify_users():
    try:
        conn = cx_Oracle.connect("chrisorigi", "Myles003", dsn, mode=cx_Oracle.SYSDBA)
        cur = conn.cursor()

        cur.execute("SELECT username, account_status FROM dba_users WHERE username IN ('APP_USER', 'APP_DEV')")
        rows = cur.fetchall()

        print("=== User Verification Results ===")
        if rows:
            for user, status in rows:
                print(f"[✓] {user} - {status}")
        else:
            print("[✗] No matching users found.")

        cur.close()
        conn.close()
    except Exception as e:
        print("[Error]", e)
        sys.exit(1)

if __name__ == "__main__":
    verify_users()

