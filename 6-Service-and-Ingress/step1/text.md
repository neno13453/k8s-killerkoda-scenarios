You have an existing deployment named `web-server` . Perform the following steps:

1. Expose the `web-server` deployment internally within the cluster using a Service named `web-server-service` with service type `clusterIP` .
2. Use `port-forward` on `nginx-service` service to access the UI of pod using the curl command with 127.0.0.1:80
```
# & is to make port-forward running in background
kubectl port-forward svc/<service name> <port of service> & 
```{{copy}}

<br>
<details><summary>Hint:</summary>
<br>

https://kubernetes.io/docs/concepts/services-networking/service/#type-clusterip

https://kubernetes.io/docs/reference/kubectl/generated/kubectl_port-forward/

</details>



<br>
<details><summary>Solution</summary>
<br>
Execute below command to create pod with temporary storage(emptyDir)

```plain
kubectl apply -f - <<EOF

apiVersion: v1
kind: Service
metadata:
  labels:
    app: web-server
  name: web-server-service
spec:
  ports:
  - port: 80
    protocol: TCP
    targetPort: 80
  selector:
    app: nginx
  sessionAffinity: None
  type: ClusterIP

EOF


OR


kubectl expose deployment web-server --name web-server-service
```

<br>
Validate the created service

```
kubectl get service
```{{copy}}

</details>
