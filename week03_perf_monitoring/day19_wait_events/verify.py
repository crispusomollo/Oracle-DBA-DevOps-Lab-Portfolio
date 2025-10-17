#!/usr/bin/env python3
import re

before = open("output/plan_before.log").read()
after = open("output/plan_after.log").read()

def extract_cost(log):
    match = re.search(r"cost=\d+", log, re.IGNORECASE)
    return int(match.group().split('=')[1]) if match else None

before_cost = extract_cost(before)
after_cost = extract_cost(after)

print("\n[✓] SQL Plan Comparison Results:\n")
print(f"Before Optimization Cost: {before_cost}")
print(f"After Optimization Cost:  {after_cost}")

if after_cost and before_cost:
    improvement = round(((before_cost - after_cost) / before_cost) * 100, 2)
    print(f"\n[💡] Performance Improvement: {improvement}%")
else:
    print("\n[!] Could not extract cost from logs — check SQL*Plus output.")

