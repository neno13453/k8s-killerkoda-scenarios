An administrator can create multiple volumes for later use. For instance, if the power to create volumes takes special access in a cloud providers portal. For that reason, and to make sure multiple applications don't try to share the same volumes unless intended, you must claim Persistent Volumes. To do so you create an object called a `PersistentVolumeClaim`. These objects also allow for controllers to create volumes on demand as they're needed and destroy them. For our use case, however, we've created our volume and now need to claim it so we can use it.

Create a `PersistentVolumeClaim` named `my-claim` that requests a volume of size `100Mi`, make sure the `storageClassName` is `manual` so Kubernetes will match our Claim to the volume we created earlier.

Make sure after creating the claim it shows up as `Bound`. If not, check to make sure the claim parameters match the volume.

<br>
<details><summary>Hint:</summary>
<br>

https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/#create-a-persistentvolumeclaim
</details>

<br>
<details><summary>Solution</summary>
<br>
Execute below command to create PersistentVolumeClaim(PVC)

```plain
kubectl apply -f - <<EOF

apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: my-claim #changed
spec:
  storageClassName: manual #important
  volumeName: my-volume 
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 100Mi #changed

EOF
```{{copy}}
<br>
Make sure that PVC is in `Bound` status

```
kubectl get pvc
```{{copy}}

</details>
