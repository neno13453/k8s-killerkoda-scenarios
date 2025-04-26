#!/bin/bash
echo "127.0.0.1 web.local" | sudo tee -a /etc/hosts
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
helm upgrade --install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard --create-namespace --namespace kubernetes-dashboard

kubectl create deployment web-server --image=nginx
kubectl run test-connection-pod --image nginx:alpine -- /bin/sh -c "sleep 7200"