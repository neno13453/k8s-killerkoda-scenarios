#!/bin/bash

echo "Verifying Step 2: Repeated Job with 3 completions..."

if kubectl get job repeat-job >/dev/null 2>&1; then
  completions=$(kubectl get job repeat-job -o jsonpath='{.status.succeeded}')
  if [[ "$completions" == "3" ]]; then
    echo "repeat-job succeeded with 3 completions."
    exit 0
  else
    echo "repeat-job found but has $completions completions (expected 3)."
    exit 1
  fi
else
  echo "repeat-job not found."
  exit 1
fi
