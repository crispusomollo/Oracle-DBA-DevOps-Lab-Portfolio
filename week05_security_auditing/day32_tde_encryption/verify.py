# verify_tde.py
import cx_Oracle
conn = cx_Oracle.connect("chrisorigi/Myles003@localhost:1539/FREEPDB1")
cur = conn.cursor()
cur.execute("SELECT tablespace_name, encrypted FROM dba_tablespaces WHERE encrypted='YES'")
print("Encrypted Tablespaces:")
for t in cur.fetchall():
    print("-", t[0])

