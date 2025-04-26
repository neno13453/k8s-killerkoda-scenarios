# Kubernetes Ingress Lab

In this lab, you’ll learn how to expose a Kubernetes service using an Ingress controller and a basic Ingress rule.

---

## Step 1: Deploy an Example App

Create a simple NGINX deployment:

```bash
kubectl create deployment web --image=nginx
kubectl expose deployment web --port=80 --target-port=80

apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: web-ingress
spec:
  rules:
  - host: web.local
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: web
            port:
              number: 80


create dns in hostfile
echo "127.0.0.1 xxx" | sudo tee -a /etc/hosts
