import cx_Oracle
import datetime

def monitor_db():
    conn = cx_Oracle.connect("sys/Myles003@localhost:1539/FREEPDB1", mode=cx_Oracle.SYSDBA)
    cur = conn.cursor()
    log_file = "./output/monitor_log.txt"
    with open(log_file, "a") as f:
        f.write(f"\n[MONITOR] {datetime.datetime.now()}\n")
        cur.execute("SELECT INSTANCE_NAME, STATUS FROM V$INSTANCE")
        for row in cur:
            f.write(f"Instance: {row[0]} | Status: {row[1]}\n")
        cur.execute("SELECT COUNT(*) FROM DBA_USERS")
        users = cur.fetchone()[0]
        f.write(f"Active Users: {users}\n")
    cur.close()
    conn.close()
    print("[+] Monitoring data saved to output/monitor_log.txt")

if __name__ == "__main__":
    monitor_db()
