#!/usr/bin/env python3
import re
import glob
from datetime import datetime

def parse_log(file_path):
    with open(file_path, 'r') as f:
        lines = f.readlines()
    errors = [l.strip() for l in lines if re.search(r'ORA-|error|fail|corrupt', l, re.I)]
    return errors

def main():
    print("\n--- Log Analysis Summary ---")
    all_logs = glob.glob("../day13_flashback_rman_datapump/output/*_log_*.log")

    for log in all_logs:
        print(f"\n[Checking] {log}")
        errors = parse_log(log)
        if errors:
            print(f"  [✗] Issues found ({len(errors)}):")
            for e in errors[:5]:
                print("   ", e)
        else:
            print("  [✓] Clean - No errors detected.")

    print("\nReport generated:", datetime.now().strftime("%Y-%m-%d %H:%M:%S"))

if __name__ == "__main__":
    main()

