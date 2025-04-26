#!/bin/bash

kubectl create deployment web-server --image=nginx
kubectl run test-connection-pod --image nginx:alpine -- /bin/sh -c "sleep 7200"