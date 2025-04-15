> Cleaning up the resources. We can use `kubectl delete` to delete any deprecated or unwanted resource inside the cluster
<br>

For example,
```
kubectl delete deployment <deployment name>
kubectl delete ns <namespace>
kubectl delete configmap <configmap name>
kubectl delete secret <secret name>
```

Let's get started with our lab clean up and delete resources that we just created
```
kubectl delete secret database-secret -n web-server
kubectl delete configmap my-config -n web-server
kubectl delete deployment nginx -n web-server
kubectl delete namespace web-server
kubectl delete deployment dummy
```{{copy}}

<br>
Let's validate and make sure the all resource under `default` and `web-server` namespace has been removed
```
kubectl get all                 # get all resource under default namespcace
kubectl get all -n web-server   # get all resource under web-server namespcace
```{{copy}}

You will notice that, we unable to get resource under the `web-server` namespace as it's removed