# verify_masking.py
import cx_Oracle
conn = cx_Oracle.connect("hr/password@localhost/XEPDB1")
cur = conn.cursor()
cur.execute("SELECT first_name, salary FROM emp_sensitive FETCH FIRST 5 ROWS ONLY")
for row in cur.fetchall():
    print(row)

