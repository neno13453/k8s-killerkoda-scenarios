Create secret name `certificate` from file `/root/cert.pem` and mount as file into pod name `login` at path `/etc/cert`. 

Then check file under path `/etc/cert`


Docs:
https://kubernetes.io/docs/tasks/inject-data-application/distribute-credentials-secure/


Pod template
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: login
spec:
  containers:
  - name: login
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
kubectl create secret generic certificate --from-file=cert.pem

kubectl apply -f - <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: login
spec:
  containers:
    - name: login
      image: nginx
      volumeMounts:
        # name must match the volume name below
        - name: certificate-volume
          mountPath: /etc/cert
          readOnly: true
  # The secret data is exposed to Containers in the Pod through a Volume.
  volumes:
    - name: certificate-volume
      secret:
        secretName: certificate

EOF
```

</details>
