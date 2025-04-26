> A ConfigMap is an API object used to store non-confidential data in key-value pairs. Pods can consume ConfigMaps as environment variables, command-line arguments, or as configuration files in a volume.

Create a ConfigMap named `someendpoint` with content `endpoint1=google.com` and `endpoint2=accenture.com`






<br>
<details><summary>Tip</summary>
<br>

```plain
https://kubernetes.io/docs/concepts/configuration/configmap/

OR

kubectl create cm trauerweide -h
```

</details>



<br>
<details><summary>Solution</summary>
<br>

```plain
kubectl apply -f - <<EOF
apiVersion: v1
data:
  endpoint1: google.com
  endpoint2: accenture.com
kind: ConfigMap
metadata:
  name: someendpoint

EOF

OR

kubectl create cm someendpoint --from-literal endpoint1=google.com --from-literal endpoint2=accenture.com 
```

</details>
