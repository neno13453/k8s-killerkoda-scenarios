#!/bin/bash


kubectl create deployment web-server --image=nginx
kubectl create deploy test-connection-pod --image busybox -- /bin/sh -c "sleep 3600"