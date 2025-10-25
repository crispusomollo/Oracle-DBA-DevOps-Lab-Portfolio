# verify_auditing.py
import cx_Oracle, csv
conn = cx_Oracle.connect("chrisorigi/Myles003@localhost:1539/FREEPDB1")
cur = conn.cursor()
cur.execute("""SELECT username, action_name, extended_timestamp FROM dba_audit_trail ORDER BY extended_timestamp DESC""")
rows = cur.fetchall()
with open("./logs/audit_report.csv", "w") as f:
    for r in rows:
        f.write(f"{r[0]},{r[1]},{r[2]}\n")
print("Audit report saved.")

