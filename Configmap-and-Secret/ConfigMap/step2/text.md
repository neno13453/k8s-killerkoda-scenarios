

Create a ConfigMap named `web-page` that contain file `/tmp/home.html`

https://kubernetes.io/docs/concepts/configuration/configmap/


<br>
<details><summary>Tip</summary>
<br>

```plain
kubectl create configmap -h
```

</details>


<br>
<details><summary>Solution</summary>
<br>

```plain
kubectl apply -f - <<EOF
apiVersion: v1
data:
  home.html: |
    <!DOCTYPE html>
    <html>
    <head>
      <title>My Simple Page</title>
    </head>
    <body>
      <h1>Hello, World!</h1>
      <p>This is a simple HTML page.</p>
    </body>
    </html>
kind: ConfigMap
metadata:
  creationTimestamp: null
  name: web-page

EOF

OR

kubectl create configmap web-page --from-file /tmp/home.html
```

</details>
