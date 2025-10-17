#!/usr/bin/env python3
import cx_Oracle
import sys

dsn = cx_Oracle.makedsn("localhost", 1539, service_name="FREEPDB1")

def check_privileges():
    try:
        conn = cx_Oracle.connect("chrisorigi", "Myles003", dsn, mode=cx_Oracle.SYSDBA)
        cur = conn.cursor()

        print("=== Role Verification ===")
        cur.execute("""
            SELECT role, authentication_type FROM dba_roles 
            WHERE role IN ('APP_READONLY', 'APP_DEVOPS')
        """)
        for row in cur.fetchall():
            print(f"[✓] Role: {row[0]} | Auth: {row[1]}")

        print("\n=== Role Privileges ===")
        cur.execute("""
            SELECT grantee, privilege 
            FROM dba_sys_privs 
            WHERE role IN ('APP_READONLY', 'APP_DEVOPS')
            ORDER BY grantee
        """)
        for row in cur.fetchall():
            print(f"[→] {row[0]} | {row[1]}")

        print("\n=== Role Grants to Users ===")
        cur.execute("""
            SELECT grantee, granted_role 
            FROM dba_role_privs
            WHERE granted_role IN ('APP_READONLY', 'APP_DEVOPS')
        """)
        for row in cur.fetchall():
            print(f"[✓] User: {row[0]} | Role: {row[1]}")

        cur.close()
        conn.close()
    except Exception as e:
        print("[Error]", e)
        sys.exit(1)

if __name__ == "__main__":
    check_privileges()

