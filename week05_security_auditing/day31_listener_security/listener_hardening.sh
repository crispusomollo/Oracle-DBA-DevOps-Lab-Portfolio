#!/bin/bash
# listener_hardening.sh

LISTENER_FILE="$ORACLE_HOME/network/admin/listener.ora"

# Backup original
cp $LISTENER_FILE $LISTENER_FILE.bak

# Restrict ADMIN commands and enable logging
echo "ADMIN_RESTRICTIONS_LISTENER=ON" >> $LISTENER_FILE
echo "LOGGING_LISTENER=ON" >> $LISTENER_FILE
echo "TRACE_LEVEL_LISTENER=USER" >> $LISTENER_FILE
echo "SSL_CLIENT_AUTHENTICATION=TRUE" >> $LISTENER_FILE

#lsnrctl reload
echo "Listener hardened and reloaded."

