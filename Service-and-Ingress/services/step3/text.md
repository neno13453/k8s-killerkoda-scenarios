Nodeport is a service type that exposes a service externally by opening a specific port on each node in the cluster
<br>
Continuing from previous lab a deployment called `web-server` have expose with ClusterIP. Now, try to expose another service name `external-web-server` with port `80` using `NodePort`. Once, `NodePort` created, you can validate by `curl <node ip>:<NodePort port>`
<br>

<details><summary>Hint:</summary>
<br>
You can retrieve node ip and port using below command

```
# Get no with details
kubectl get no -owide

# Get NodePort port
kubectl get svc
```

And 

</details>


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
  name: external-web-server
spec:
  ports:
  - port: 80
    protocol: TCP
    targetPort: 80
  selector:
    app: web-server
  type: NodePort

EOF


OR


kubectl expose deployment web-server --name external-web-server --type=NodePort --port 80 
```

<br>
Validate that NodePort successfully exposed using:

```

node_ip=$(kubectl get no -owide | sed '1d'| awk '{print $6}')
svc_port=$(kubectl get svc external-web-server -ojson | jq .spec.ports[0].nodePort)
curl $node_ip:$svc_port
```

</details>

