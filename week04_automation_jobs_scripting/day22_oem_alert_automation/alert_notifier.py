#!/usr/bin/env python3
import json, os, smtplib
from datetime import datetime
from email.mime.text import MIMEText
from rich.console import Console

console = Console()
ALERT_FILE = "output/alerts.json"
LOG_FILE = "output/notifications.log"

# Dummy alert log sample if OEM views unavailable
if not os.path.exists(ALERT_FILE):
    sample_alerts = [
        {"Timestamp": "2025-10-17 09:00:12", "Component": "DB Writer", "Severity": "CRITICAL", "Message": "DBWR process terminated unexpectedly"},
        {"Timestamp": "2025-10-17 09:15:42", "Component": "Listener", "Severity": "ERROR", "Message": "TNS-12514: Listener does not currently know of service requested"}
    ]
    with open(ALERT_FILE, "w") as f: json.dump(sample_alerts, f, indent=2)

# Load alert JSON
alerts = []
try:
    with open(ALERT_FILE) as f:
        alerts = json.load(f)
except Exception:
    console.print("[red]Error reading alert file[/red]")
    exit(1)

if not alerts:
    console.print("[green]No new OEM alerts found.[/green]")
    exit(0)

# Display on terminal
console.rule("[bold yellow]OEM Alerts Detected[/bold yellow]")
for a in alerts:
    console.print(f"[red]{a['Severity']}[/red] | {a['Timestamp']} | {a['Component']}: {a['Message']}")

# Log alerts
with open(LOG_FILE, "a") as log:
    for a in alerts:
        log.write(f"{datetime.now()} | {a['Severity']} | {a['Component']} | {a['Message']}\n")

# Optional email notification (simulation)
def send_email_alert(alert_list):
    sender = "oem-alerts@yourdomain.com"
    recipient = "admin@yourdomain.com"
    body = "\n".join([f"{a['Severity']} - {a['Component']}: {a['Message']}" for a in alert_list])
    msg = MIMEText(body)
    msg["Subject"] = f"[OEM ALERT] {len(alert_list)} new alerts detected"
    msg["From"] = sender
    msg["To"] = recipient
    try:
        # Use a local mail relay or simulate
        smtp = smtplib.SMTP("localhost")
        smtp.sendmail(sender, [recipient], msg.as_string())
        smtp.quit()
        console.print("[cyan]Email notification sent to admin.[/cyan]")
    except Exception:
        console.print("[yellow]Email notification simulated (no SMTP configured).[/yellow]")

send_email_alert(alerts)

