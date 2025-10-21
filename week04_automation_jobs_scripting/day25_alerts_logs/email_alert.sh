#!/bin/bash
SUBJECT=$1
BODY=$2
TO="dba-team@example.com"
echo "$BODY" | mail -s "$SUBJECT" "$TO"

