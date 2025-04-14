Now that our pod has a `PersistentVolume` any data it creates under `/mnt/share/my-pvc` will persist even if the container crashes or restarts.

Go ahead and create a file named `coolfile` in the container `pvc-user` under `/mnt/share/my-pvc`.

Restart/Recreate the container

Look under `/mnt/share/my-pvc` is `coolfile` still there?

<br>
<details><summary>Hint:</summary>
<br>
you can use `exec` command to execute into pod's container

```
kubectl exec -it <pod name> -- bash
```{{copy}}

Terminate and re-create pod with `kubectl replace`. Note: -oyaml will create a yaml definition file from existing pod.

```
kubectl get po <pod name> -o yaml | kubectl replace -f - --force
```{{copy}}
</details>


<br>
<details><summary>Solution</summary>
<br>

```plain
kubectl exec pvc-user -- touch /mnt/share/my-pvc/coolfile

kubectl get pod pvc-user -o yaml | kubectl replace -f - --force

sleep 5 # Wait for the pod to come back

kubectl exec pvc-user -- ls /mnt/share/my-pvc
```{{copy}}

</details>