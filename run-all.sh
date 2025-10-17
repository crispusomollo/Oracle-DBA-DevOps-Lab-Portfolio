#!/bin/bash

# Runs all automation scripts by scanning folders

echo "[*] Running all automation scripts..."
find . -type f -name run.sh | sort | while read script; do
  echo ">>> Running: $script"
  bash "$script"
done

