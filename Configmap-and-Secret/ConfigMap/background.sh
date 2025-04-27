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

cat << EOF > /tmp/home.html
<!DOCTYPE html>
<html>
<head>
  <title>My Simple Page</title>
</head>
<body>
  <h1>Hello, World!</h1>
  <p>This is a simple HTML page.</p>
</body>
</html>
EOF
