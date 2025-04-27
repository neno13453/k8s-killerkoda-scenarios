#!/bin/bash
  
validate=$(kubectl get deployment my-first-deployment -o yaml | yq 'all(.spec.template.spec.containers[];  .resources.requests.memory == "256Mi" and  .resources.requests.cpu == "50m" and  .resources.limits.memory == "256Mi")')

if [ "$validate" = "true" ]; then
    exit 0
else
    exit 1
fi