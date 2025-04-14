#!/bin/bash

kubectl rollout status deploy backend --timeout=1s
kubectl rollout status deploy frontend --timeout=1s
kubectl rollout status deploy gateway --timeout=1s
kubectl rollout status deploy proxy --timeout=1s
