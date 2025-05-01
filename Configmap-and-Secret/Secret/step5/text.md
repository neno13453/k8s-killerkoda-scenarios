Create a Secret named `my-secret` in the `default` namespace with the following key-value pairs:
- `username`: `admin`
- `password`: `1234`

Then create a pod called `backend` and map those secret as environment variable. Where environment variable `SECRET_USERNAME` will contain values of key `username` and `SECRET_PASSWORD` with key `password`

Lastly, get inside the pod and run `printenv`.


Docs:
https://kubernetes.io/docs/tasks/inject-data-application/distribute-credentials-secure/#define-container-environment-variables-using-secret-data


Pod template
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: backend
spec:
  containers:
  - name: backend
    image: nginx
```

<br>
<details><summary>Tip</summary>
<br>

```plain
# Create secret with commandline
kubectl create secret generic -h

# Apply yaml
kubectl apply -f

# Access pod
kubectl exec -it <pod name> -- sh
```

</details>


<br>
<details><summary>Solution</summary>
<br>

```plain
# To create secret
kubectl create secret generic my-secret --from-literal=username=admin --from-literal=password=1234

kubectl apply -f - <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: backend
spec:
  containers:
  - name: backend
    image: nginx
    env:
    - name: SECRET_USERNAME
      valueFrom:
        secretKeyRef:
          name: my-secret
          key: username
    - name: SECRET_PASSWORD
      valueFrom:
        secretKeyRef:
          name: my-secret
          key: password

EOF
```

```
# To run printenv insisde pod
kubectl exec -it backend -- printenv | grep SECRET
```

</details>
