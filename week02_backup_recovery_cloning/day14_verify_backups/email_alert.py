#!/usr/bin/env python3
import smtplib
from email.mime.text import MIMEText
from datetime import datetime

def send_email(report_file):
    with open(report_file, 'r') as f:
        content = f.read()

    msg = MIMEText(content)
    msg['Subject'] = f"Oracle Backup Verification Report - {datetime.now().strftime('%Y-%m-%d')}"
    msg['From'] = "oracle-backup@lab.local"
    msg['To'] = "admin@company.com"

    with smtplib.SMTP('smtp.gmail.com', 587) as server:
        server.starttls()
        server.login("youremail@gmail.com", "yourpassword")  # Use App Passwords
        server.send_message(msg)
        print("[✓] Email sent successfully.")

if __name__ == "__main__":
    send_email("./output/backup_status_report_$(date +%Y%m%d).log")


