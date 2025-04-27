#!/bin/bash

kubectl get configmap someendpoint -oyaml | grep 'endpoint1: google.com'
kubectl get configmap someendpoint -oyaml | grep 'endpoint2: accenture.com'
