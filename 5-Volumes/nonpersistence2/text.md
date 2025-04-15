
> Pods in Kubernetes are ephemeral, when they are deleted or restarted any changes to their filesystem or memory is lost. Though, we can still leverage ephemeral state for temporary data uses with `emptyDir` configuration.

https://kubernetes.io/docs/concepts/storage/volumes/#emptydir

To confirm on the non-persistence storage like emptyDir. Let's try to create some file under mount path and delete the pod


<br>
<details><summary>Hint:</summary>
<br>
You can go inside the pod and create some file by using below command

```
kubectl exec -it <pod name> -- bash
```

</details>

<br>
<details><summary>Solution</summary>
<br>


```plain
kubectl exec -it <pod name> -- touch /cache/somefile
kubectl exec -it <pod name> -- ls -l /cache
```

<br>

Delete pod and execute into pod to see the result

```
kubectl delete pod <pod name>
kubectl exec -it <pod name> -- ls -l /cache
```{{copy}}


</details>

