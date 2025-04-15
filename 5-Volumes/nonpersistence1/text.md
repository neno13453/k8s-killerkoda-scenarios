
> Pods in Kubernetes are ephemeral, when they are deleted or restarted any changes to their filesystem or memory is lost. Though, we can still leverage ephemeral state for temporary data uses with `emptyDir` configuration.

https://kubernetes.io/docs/concepts/storage/volumes/#emptydir

By default, `emptyDir` will using the node storage for temporary and release once the pod restart or delete. However, user need to be careful on disk usage, if too much it can cause `diskPressure` or simply mean disk full and will make node unhealthy.

Create a deploy named `deploy-with-emptydir` using image `nginx` with `emptyDir` size limit of `100Mi` in the `default` namespace. Additionally, please mount the path under `/cache`

<br>
<details><summary>Solution</summary>
<br>
Execute below command to create pod with temporary storage(emptyDir)

```plain
kubectl apply -f - <<EOF

apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: deploy-with-emptydir
  name: deploy-with-emptydir
spec:
  replicas: 1
  selector:
    matchLabels:
      app: deploy-with-emptydir
  template:
    metadata:
      labels:
        app: deploy-with-emptydir
    spec:
      containers:
      - image: nginx
        name: nginx
        volumeMounts:
        - mountPath: /cache
          name: temp-volume
      volumes:
      - name: temp-volume
        emptyDir:
          sizeLimit: 100Mi

EOF
```{{copy}}

<br>
Validate that deplyoment successfully created and ready

```
kubectl get deploy
```{{copy}}

</details>

