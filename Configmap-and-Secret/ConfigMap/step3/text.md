1. Create a configmap from path `/tmp/configmap.yaml`
2. Create a pod named `pod1` of image `nginx:alpine`
2. Make key `color` of ConfigMap `oak` available as environment variable `TREE_COLOR`
4. Check environment variable `TREE_COLOR` by access in the running Pod

Docs:
https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/#define-container-environment-variables-with-data-from-multiple-configmaps



<br>
<details><summary>Tip</summary>
<br>

```plain

# Apply yaml file from
kubectl apply -f

# Access pod
kubectl exec -it <pod name> -- sh
```

</details>


<br>
<details><summary>Solution</summary>
<br>

```plain
kubectl apply -f /tmp/configmap.yaml
kubectl apply -f - <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: pod1
spec:
  containers:
  - image: nginx:alpine
    name: pod1
    env:
      - name: TREE_COLOR
        valueFrom:
          configMapKeyRef:
            name: oak
            key: color

EOF

```

```
kubectl exec -it pod1 -- sh
  echo $TREE_COLOR
```

</details>
