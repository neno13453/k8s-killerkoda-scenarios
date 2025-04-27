#!/bin/bash

kubectl get configmap web-page
kubectl get cm web-page -oyaml | grep "home.html: |"