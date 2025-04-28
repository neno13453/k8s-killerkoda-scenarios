You have an existing deployment named `web-server` . Perform the following steps:

Expose the `web-server` deployment internally within the cluster using a Service named `web-server-service` with service type `clusterIP` and port `80` .
<br>
Since the `ClusterIP` only accessible via internal connection within cluster(pod-to-pod). Try to access `web-server-service` via  `test-connection-pod` running in default namespace using curl command


```
kubectl exec -it test-connection-pod -- curl <service name>
```

<br>
<details><summary>Tip</summary>
<br>

```plain
https://kubernetes.io/docs/concepts/services-networking/service/
```

</details>


The command allow you to execute command inside the container inside the pod. 


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

```

# Run command to execute CLI inside the pod
kubectl exec -it test-connection-pod -- curl web-server-service
```

</details>
