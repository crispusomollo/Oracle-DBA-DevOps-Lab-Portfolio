#!/usr/bin/env python3
import cx_Oracle
import sys

dsn = cx_Oracle.makedsn("localhost", 1539, service_name="FREEPDB1")

def verify_audit():
    try:
        conn = cx_Oracle.connect("chrisorigi", "Myles003", dsn, mode=cx_Oracle.SYSDBA)
        cur = conn.cursor()

        print("=== Active Audit Policies ===")
        cur.execute("""
            SELECT policy_name, enabled_option, entity_name 
            FROM audit_unified_enabled_policies
            WHERE policy_name LIKE '%SECURE%'
        """)
        for row in cur.fetchall():
            print(f"[✓] {row[0]} | Mode: {row[1]} | User: {row[2]}")

        print("\n=== Recent Audit Trail Entries ===")
        cur.execute("""
            SELECT dbusername, userhost, action_name, object_name, event_timestamp
            FROM unified_audit_trail
            WHERE event_timestamp > SYSDATE - 1
              AND dbusername IN ('CHRISORIGI', 'SYS')
            ORDER BY event_timestamp DESC FETCH FIRST 10 ROWS ONLY
        """)
        for row in cur.fetchall():
            print(f"[→] {row[0]} | {row[1]} | {row[2]} | {row[3]} | {row[4]}")

        cur.close()
        conn.close()
    except Exception as e:
        print("[Error]", e)
        sys.exit(1)

if __name__ == "__main__":
    verify_audit()

