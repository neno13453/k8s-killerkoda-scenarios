#!/bin/bash



kubectl get svc web-server-service
kubectl expose deployment web-server --name web-server-service
kubectl port-forward svc/web-server-service 80 & 
sleep 3
curl 127.0.0.1:80
if [[ $? = 0 ]]; then
    exit 0
else
    exit 1
fi