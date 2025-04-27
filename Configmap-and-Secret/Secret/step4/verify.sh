#!/bin/bash

kubectl get secret token1 -oyaml | grep "cardnumber: MTIzNDU2Nzg="
kubectl get secret token1 -oyaml | grep "pin: MTIzNA=="
cat /tmp/answer1 | grep MTIzNA==
cat /tmp/answer1 | grep MTIzNDU2Nzg=
cat /tmp/answer2 | grep a8FbGk3LmN7XpTqZ