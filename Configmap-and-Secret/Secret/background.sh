#!/bin/bash

cat << EOF > /tmp/secret.yaml
apiVersion: v1
data:
  token: YThGYkdrM0xtTjdYcFRxWg==
kind: Secret
metadata:
  name: token
EOF

openssl req -x509 -newkey rsa:2048 -keyout /root/key.pem -out /root/cert.pem -days 365 -nodes -subj "/CN=localhost"