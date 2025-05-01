#!/bin/bash

SIZE=$(kubectl get deploy deploy-with-emptydir -o json | jq -r '.spec.template.spec.volumes[] | select(.name == "temp-volume") | .emptyDir.sizeLimit')
PODNAME=$(kubectl get po | grep deploy-with-emptydir| awk '{print $1}')
if [[ $SIZE = "100Mi" && $PODNAME ]]; then
    exit 0
else
    exit 1
fi