#!/bin/bash

# Runs all verification scripts

echo "[*] Verifying all tasks..."
find . -type f \( -name "verify.sh" -o -name "verify.py" \) | sort | while read verifier; do
  echo ">>> Verifying: $verifier"
  if [[ $verifier == *.py ]]; then
    python3 "$verifier"
  else
    bash "$verifier"
  fi
done

