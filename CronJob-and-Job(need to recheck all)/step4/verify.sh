#!/bin/bash

echo "Verifying Step 4: Failing CronJob with retries..."

if kubectl get cronjob fail-cronjob >/dev/null 2>&1; then
  job_name=$(kubectl get jobs --selector=job-name!=hello-job --sort-by=.metadata.creationTimestamp -o jsonpath='{.items[-1:].metadata.name}')
  failures=$(kubectl get job "$job_name" -o jsonpath='{.status.failed}' 2>/dev/null)

  if [[ "$failures" -ge 1 ]]; then
    echo "fail-cronjob created a job that failed as expected ($failures failures)."
    exit 0
  else
    echo "CronJob exists, but job did not fail as expected (failures=$failures)."
    exit 1
  fi
else
  echo "fail-cronjob not found."
  exit 1
fi
