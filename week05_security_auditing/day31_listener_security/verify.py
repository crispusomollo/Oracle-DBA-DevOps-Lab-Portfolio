# verify_listener.py
import re
path = "$ORACLE_HOME/network/admin/listener.ora"
with open(path) as f:
    for line in f:
        if re.search("ADMIN_RESTRICTIONS|SSL_CLIENT_AUTHENTICATION", line):
            print("Config:", line.strip())

