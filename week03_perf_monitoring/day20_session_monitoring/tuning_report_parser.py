#!/usr/bin/env python3
import re

report = open("output/tuning_report.txt").read()

print("\n[✓] SQL Tuning Advisor Summary:\n")

recommendations = re.findall(r"Recommendation: (.*)", report)
for r in recommendations:
    print(f" - {r.strip()}")

if not recommendations:
    print("No explicit recommendations found. Check report manually.")

