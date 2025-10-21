from datetime import datetime

def generate_report():
    with open("./output/monitor_log.txt") as log:
        data = log.read()
    html_content = f"""
    <html>
    <body>
    <h2>Daily DBA Report - {datetime.now().strftime('%Y-%m-%d')}</h2>
    <pre>{data}</pre>
    </body>
    </html>
    """
    with open("./output/daily_report.html", "w") as f:
        f.write(html_content)
    print("[+] Daily report generated: output/daily_report.html")

if __name__ == "__main__":
    generate_report()

