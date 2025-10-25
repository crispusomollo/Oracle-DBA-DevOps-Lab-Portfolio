#!/bin/bash
# Day 36 - Create API key and configure OCI CLI (interactive parts require your input)
#
# Prereqs:
#  - oci-cli installed (pip install oci)
#  - ssh-keygen available

# Fill these values
TENANCY_OCID="ocid1.tenancy.oc1..aaaaaaa..."
USER_OCID="ocid1.user.oc1..aaaaaaa..."
REGION="eu-frankfurt-1"  # set your region
KEY_FILE="$HOME/.oci/oci_api_key.pem"

mkdir -p $HOME/.oci
ssh-keygen -m PEM -t rsa -b 2048 -f ${KEY_FILE} -N "" >/dev/null 2>&1

# Extract public key (the oci console expects the public key in text)
openssl rsa -in ${KEY_FILE} -pubout -out ${KEY_FILE}.pub

echo "Upload ${KEY_FILE}.pub contents to OCI Console > Identity > Users > (select user) > API Keys"
echo "Then configure CLI using oci setup config (provide tenancy, user, region, fingerprint, and key file path)."
echo "Running: oci setup config"
oci setup config

