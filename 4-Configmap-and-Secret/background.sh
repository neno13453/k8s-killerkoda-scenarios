#!/bin/bash


cat << EOF > /tmp/configmap.yaml
apiVersion: v1
data:
  tree: oak
  height: "3"
  color: red
kind: ConfigMap
metadata:
  name: oak
EOF