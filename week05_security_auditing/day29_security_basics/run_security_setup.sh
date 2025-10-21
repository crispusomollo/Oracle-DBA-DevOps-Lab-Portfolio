#!/bin/bash
echo "[*] Applying Oracle Security Best Practices..."
sqlplus / as sysdba <<EOF
@../sql/create_security_roles.sql
@../sql/password_policy.sql
@../sql/user_hardening.sql
@../sql/verify_security.sql
EOF
echo "[+] Security configuration completed."

