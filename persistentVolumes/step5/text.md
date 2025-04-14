It's always a good idea to clean up any resources that are no longer used.

Delete the pod `pvc-user`.
Delete the PVC `my-claim`.
Delete the PV `my-volume`

Check `/tmp/my-cool-vol` on the host. Did K8s clean up the volume? 

<br>
<details><summary>Hint:</summary>
<br>
You can delete any resources in K8s using `kubectl delete <resource> <resource name>`
For example:
    kubectl delete pod mypod
</details>

<br>
<details><summary>Solution</summary>
<br>

```plain
kubectl delete pod pvc-user
kubectl delete pvc my-claim
kubectl delete pv my-volume
```{{copy}}

Did K8s Clean up the volume?
No. By default, if you don't specify a `persistentVolumeReclaimPolicy` K8s defaults to Retain. Better safe than sorry!

</details>
