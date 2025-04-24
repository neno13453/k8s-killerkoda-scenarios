Now try to use `port-forward` on `nginx-service` service to access the UI of pod using the curl command with 127.0.0.1:80

```
# & is to make port-forward running in background
kubectl port-forward svc/<service name> <port of service> & 
```

<br>
<details><summary>Hint:</summary>
<br>

https://kubernetes.io/docs/concepts/services-networking/service/#type-clusterip

https://kubernetes.io/docs/reference/kubectl/generated/kubectl_port-forward/

</details>



<br>
<details><summary>Solution</summary>
<br>

<br>
Port-forward and access the service

```
kubectl port-forward svc/web-server-service 80 &  
curl 127.0.0.1:80
```{{copy}}

</details>
