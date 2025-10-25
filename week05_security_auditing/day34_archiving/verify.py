# verify_archivelog.py
import os, time
path = "/opt/oracle/fast_recovery_area/FREE/archivelog"
now = time.time()
for f in os.listdir(path):
    full = os.path.join(path, f)
    if f.endswith(".arc"):
        age = (now - os.path.getmtime(full)) / 86400
        print(f"{f} - {age:.1f} days old")

