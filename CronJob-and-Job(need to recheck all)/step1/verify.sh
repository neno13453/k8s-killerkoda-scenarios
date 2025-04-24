#!/bin/bash

echo "Verifying Step 1: One-time Job (hello-job)..."

if kubectl get job hello-job >/dev/null 2>&1; then
  status=$(kubectl get job hello-job -o jsonpath='{.status.succeeded}')
  if [[ "$status" == "1" ]]; then
    echo "hello-job succeeded."
    exit 0
  else
    echo "hello-job exists but hasn't succeeded yet."
    exit 1
  fi
else
  echo "hello-job not found."
  exit 1
fi
