#!/bin/bash

SIZE=$(kubectl get deploy deploy-with-emptydir -o json | jq -r '.spec.template.spec.volumes[] | select(.name == "temp-volume") | .emptyDir.sizeLimit')

if [[ $SIZE = "100Mi" ]]; then
    exit 0
else
    exit 1
fi