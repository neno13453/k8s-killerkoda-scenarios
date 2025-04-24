#!/bin/bash

echo "Verifying Step 5: CronJob with concurrency and history control..."

if kubectl get cronjob controlled-cronjob >/dev/null 2>&1; then
  policy=$(kubectl get cronjob controlled-cronjob -o jsonpath='{.spec.concurrencyPolicy}')
  success_limit=$(kubectl get cronjob controlled-cronjob -o jsonpath='{.spec.successfulJobsHistoryLimit}')
  fail_limit=$(kubectl get cronjob controlled-cronjob -o jsonpath='{.spec.failedJobsHistoryLimit}')

  if [[ "$policy" == "Forbid" && "$success_limit" == "1" && "$fail_limit" == "1" ]]; then
    echo "controlled-cronjob configured correctly (Forbid, 1/1 history limits)."
    exit 0
  else
    echo "controlled-cronjob found, but config does not match expected settings."
    echo "    concurrencyPolicy: $policy"
    echo "    successfulJobsHistoryLimit: $success_limit"
    echo "    failedJobsHistoryLimit: $fail_limit"
    exit 1
  fi
else
  echo "controlled-cronjob not found."
  exit 1
fi
