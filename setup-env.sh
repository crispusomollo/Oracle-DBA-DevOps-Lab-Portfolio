#!/bin/bash

# Load Oracle DB env variables from .env file

if [ -f ".env" ]; then
  export $(cat .env | xargs)
  echo "[✓] Oracle environment variables loaded."
else
  echo "[✗] .env file not found. Skipping environment setup."
fi

