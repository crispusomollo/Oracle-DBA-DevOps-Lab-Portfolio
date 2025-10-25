import smtplib, sys
from email.mime.text import MIMEText

subject = sys.argv[1] if len(sys.argv) > 1 else "Oracle Backup Report"
body = sys.argv[2] if len(sys.argv) > 2 else "No message body"
sender = "backup-bot@example.com"
receiver = "admin@example.com"

msg = MIMEText(body)
msg["Subject"] = subject
msg["From"] = sender
msg["To"] = receiver

with smtplib.SMTP("smtp.gmail.com", 587) as server:
    server.starttls()
    server.login("backup-bot@example.com", "YOUR_APP_PASSWORD")
    server.send_message(msg)

print(f"[*] Notification sent: {subject}")
