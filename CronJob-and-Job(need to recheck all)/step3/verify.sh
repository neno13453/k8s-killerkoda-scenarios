#!/bin/bash

echo "Verifying Step 3: CronJob ping-cronjob..."

if kubectl get cronjob ping-cronjob >/dev/null 2>&1; then
  recent_job=$(kubectl get jobs --selector=job-name!=hello-job --sort-by=.metadata.creationTimestamp -o jsonpath='{.items[-1:].metadata.name}')
  if [[ -n "$recent_job" ]]; then
    echo "CronJob 'ping-cronjob' created job: $recent_job"
    exit 0
  else
    echo "ping-cronjob found but has not created any jobs yet."
    exit 1
  fi
else
  echo "ping-cronjob not found."
  exit 1
fi
