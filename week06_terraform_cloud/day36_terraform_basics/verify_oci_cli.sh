#!/bin/bash
# Day36 verify basic OCI CLI connectivity
oci iam compartment list --all --compartment-id $TF_VAR_tenancy_ocid --region $OCI_REGION | jq '.data | length' || true
oci iam user get --user-id $TF_VAR_user_ocid --region $OCI_REGION

