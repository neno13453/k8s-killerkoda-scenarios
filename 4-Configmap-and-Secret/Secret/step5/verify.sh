#!/bin/bash

kubectl get secret my-secret -oyaml | grep "username: YWRtaW4="
kubectl get secret my-secret -oyaml | grep "password: MTIzNA=="
kubectl exec -it backend -- printenv | grep SECRET_USERNAME=admin
kubectl exec -it backend -- printenv | grep SECRET_PASSWORD=1234 