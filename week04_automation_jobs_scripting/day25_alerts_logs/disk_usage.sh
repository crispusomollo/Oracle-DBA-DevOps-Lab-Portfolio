#!/bin/bash
df -h /opt/oracle | awk 'NR==2 {print "[*] Disk Usage: "$5" used on "$1}'

