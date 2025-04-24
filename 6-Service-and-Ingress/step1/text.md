You have an existing deployment named `web-server` . Perform the following steps:

Expose the `web-server` deployment internally within the cluster using a Service named `web-server-service` with service type `clusterIP` .
<br>
Since the `ClusterIP` only accessible via internal connection within cluster(pod-to-pod). Try to access `web-server-service` via  `test-connection-pod` running in default namespace using curl command


```
kubectl exec -it test-connection-pod -- <your curl command>
```

The command allow you to execute inside the container inside the pod. 


<br>
<details><summary>Solution</summary>
<br>

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


kubectl expose deployment web-server --name web-server-service --port 80 
```

<br>
Port-forward and access the service

```
kubectl port-forward svc/web-server-service 80 &  
curl 127.0.0.1:80
```{{copy}}

</details>
