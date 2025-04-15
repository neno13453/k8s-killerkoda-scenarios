
> For Kubernetes troubleshooting, mostly there are 2 commands that we will use; `kubectl describe po <podname>` and `kubectl logs -p <podname>`. The logs and events will provide every detail you need
<br>

There are multiple unhealthy pod within the cluster. Please investigate and fix the issue accordingly

Try to check the current state of each pod by running
```
kubectl get po
```{{copy}}

Then, try to investigate and fix the issue accordingly by editing deployment resources

<br>
<details><summary>Hint: use below command to edit the existing resource</summary>
<br>

```
kubectl edit deploy <deployment name>
```{{copy}}
</details>


<br>
<details><summary>Solutions</summary>
<br>

Solution 1: The backend pod unable to startup due to wrongly config on secret name. The secret name can be found by `kubectl get secret`, then we need to `kubectl edit deploy backend` to mount with correct secret name

```
volumes:
    - name: db-secret
    secret:
        defaultMode: 420
        optional: false
        secretName: database-secret     #updated this line to existing secret name
```
Solution 2: The Frontend pod stuck as Pending state as it's using the non-exist target nodeselector. Therefore, it cannot schedule into any node. You can check the node labels by `kubectl get no --show-labels` and edit the deployment file to corresponding node or simply totally remove the nodeSelector section

```
spec:
    containers:
      - image: nginx
        imagePullPolicy: Always
        name: frontend
        resources: {}
        terminationMessagePath: /dev/termination-log
        terminationMessagePolicy: File
    dnsPolicy: ClusterFirst
    nodeSelector:           # remove this line
        role: nonexist-node # remove this line
```

Solution 3: The gateway is crashing due to livenessprobe configuration in the deployment config. It try to curl to unresolvable hostname, hence, we need to edit the deployment for gateway and update liveness probe curl target into any valida domain e.g. google.com

```
spec:
    containers:
      - image: nginx
        imagePullPolicy: Always
        livenessProbe:
          exec:
            command:
            - curl
            - google.com    # update this line to any valid hostname
```

Solution 4: Proxy pod got `ImagePullBackOff` due to image name is not exist in Docker registry. Therefore, we can just update the image name to `busybox` or any exist image name.

```
spec:
    containers:
      - image: busyboxwithtypo
        imagePullPolicy: Always
        name: busybox           # updated with correct image name
```
</details>  