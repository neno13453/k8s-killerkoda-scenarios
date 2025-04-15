#!/bin/bash

kubectl create deploy nginx --image=nginx
kubectl create secret generic database-secret --from-literal=username=admin --from-literal=password=1234
kubectl expose deployment nginx --port=80 --target-port=8000
kubectl create configmap my-config --from-literal=key1=config1 --from-literal=key2=config2