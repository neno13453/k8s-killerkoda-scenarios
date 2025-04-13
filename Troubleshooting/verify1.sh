#!/bin/bash

count=$(kubectl get po | grep 1/1 | wc -l)
if [ $count -ne 4]; then
    exit 1
fi
