#!/bin/bash

kubectl get pod pod1
kubectl exec pod1 -- printenv | grep TREE_COLOR=red
kubectl get configmap oak