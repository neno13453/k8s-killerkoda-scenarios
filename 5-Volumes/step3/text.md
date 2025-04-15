Now that we've created a PersistentVolume and a PersistentVolumeClaim, we're ready to use the volume!

Create a pod named `pvc-user` in namespace `default` that mounts your PVC `my-claim` under `/mnt/share/my-pvc`. Use the image `nginx`.

<br>
<details><summary>Hint:</summary>
<br>

https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/#create-a-pod
</details>

<br>
<details><summary>Solution</summary>
<br>
Execute command below to create pod with mount point to `my-claim` PVC

```plain
kubectl apply -f - <<EOF

apiVersion: v1
kind: Pod
metadata:
  name: pvc-user
spec:
  volumes:
    - name: my-claim
      persistentVolumeClaim:
        claimName: my-claim
  containers:
    - name: c1
      image: nginx
      volumeMounts:
        - mountPath: "/mnt/share/my-pvc"
          name: my-claim

EOF
```{{copy}}

Make sure that Pod is in `Running` state and mount the `my-claim` PVC

```
kubectl get po
kubectl describe po <pod name>
```{{copy}}

</details>
