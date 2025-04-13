#!/bin/bash

# create dummy configmap to create containerconfigerror
kubectl create secret generic database-secret --from-literal=username=admin --from-literal=password=1234

cat << EOF | kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: backend
  name: backend
spec:
  replicas: 1
  selector:
    matchLabels:
      app: backend
  template:
    metadata:
      labels:
        app: backend
    spec:
      containers:
      - image: nginx
        name: backend
        volumeMounts:
          - name: db-secret
            mountPath: /tmp
      volumes:
      - name: db-secret
        secret:
          secretName: random-secret
          optional: false
EOF

# create imagepullback 
kubectl create deployment proxy --image=busyboxwithtypo

# create pod that will crashloopback
cat << EOF | kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: gateway
  name: gateway
spec:
  replicas: 1
  selector:
    matchLabels:
      app: gateway
  template:
    metadata:
      labels:
        app: gateway
    spec:
      containers:
      - image: nginx
        name: gateway
        livenessProbe:
          exec:
            command:
            - curl
            - somedatabase
          initialDelaySeconds: 1
          periodSeconds: 1
EOF


# forcefully pod to pending
# for i in $(kubectl get no | sed -e '1d' | awk '{print $1}');do kubectl cordon $i;done
cat << EOF | kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: frontend
  name: frontend
spec:

  replicas: 1
  selector:
    matchLabels:
      app: frontend
  template:
    metadata:
      labels:
        app: frontend
    spec:
      nodeSelector: 
        role: nonexist-node
      containers:
      - image: nginx
        name: frontend
EOF