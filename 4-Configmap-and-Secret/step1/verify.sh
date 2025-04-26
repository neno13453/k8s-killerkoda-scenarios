#!/bin/bash

kubectl get configmap someendpoint -o yaml | grep 'endpoint1: google.com'
kubectl get configmap someendpoint -o yaml | grep 'endpoint2: accenture.com'
