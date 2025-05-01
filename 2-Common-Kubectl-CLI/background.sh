#!/bin/bash


cat << EOF > /tmp/namespace.yaml
apiVersion: v1
kind: Namespace
metadata:
  creationTimestamp: null
  name: web-server
EOF