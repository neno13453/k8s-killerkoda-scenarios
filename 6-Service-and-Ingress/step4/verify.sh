#!/bin/bash

node_ip=$(kubectl get no -owide | sed '1d'| awk '{print $6}')
svc_port=$(kubectl get svc external-web-server -ojson | jq .spec.ports[0].nodePort)

curl $node_ip:$svc_port