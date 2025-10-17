#!/usr/bin/env python3
import json, os, time
from datetime import datetime
from rich.console import Console
from rich.table import Table

console = Console()

def load_json(file):
    if not os.path.exists(file): return []
    with open(file) as f:
        try: return json.load(f)
        except: return []
        
def display_active_sessions(sessions):
    table = Table(title=f"Active Sessions ({len(sessions)})")
    table.add_column("SID", justify="right")
    table.add_column("Username")
    table.add_column("Program")
    table.add_column("SQL_ID")
    table.add_column("Elapsed(s)", justify="right")
    table.add_column("Wait Event")
    for s in sessions:
        table.add_row(
            str(s.get("SID","")),
            s.get("Username",""),
            s.get("Program",""),
            s.get("SQL_ID",""),
            str(s.get("Elapsed_Seconds","")),
            s.get("Wait_Event","")
        )
    console.print(table)

def display_blocking_sessions(blocks):
    if not blocks:
        console.print("[green]No blocking sessions detected.[/green]\n")
        return
    table = Table(title="Blocking Sessions Detected")
    table.add_column("Blocking User")
    table.add_column("Blocked User")
    table.add_column("Object")
    table.add_column("Lock Type")
    for b in blocks:
        table.add_row(
            b.get("Blocking_User",""),
            b.get("Blocked_User",""),
            b.get("Object",""),
            b.get("Lock_Type","")
        )
    console.print(table)

def main():
    os.system("clear")
    console.rule(f"[bold cyan]Oracle SQL Real-Time Monitoring Dashboard[/bold cyan]")
    sessions = load_json("output/active_sessions.json")
    blocks = load_json("output/blocking_sessions.json")

    display_active_sessions(sessions)
    display_blocking_sessions(blocks)

    console.print(f"\nLast refresh: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")

if __name__ == "__main__":
    main()

