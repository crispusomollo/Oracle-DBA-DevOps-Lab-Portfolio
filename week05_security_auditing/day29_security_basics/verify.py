import cx_Oracle

def check_security():
    conn = cx_Oracle.connect("sys/Myles003@localhost:1539/FREEPDB1", mode=cx_Oracle.SYSDBA)
    cur = conn.cursor()

    print("\n[✓] Checking locked accounts:")
    cur.execute("SELECT username FROM dba_users WHERE account_status LIKE 'LOCKED%'")
    for row in cur.fetchall():
        print(" -", row[0])

    print("\n[✓] Checking profiles and limits:")
    cur.execute("SELECT profile, resource_name, limit FROM dba_profiles WHERE resource_name LIKE 'PASSWORD%'")
    for row in cur.fetchall():
        print(f" {row[0]} | {row[1]} = {row[2]}")

    conn.close()

if __name__ == "__main__":
    check_security()

