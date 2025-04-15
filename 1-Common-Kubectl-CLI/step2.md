> Normally, when we run any `kubectl` command, it will only shown the resource under that certain namespace. If not specific, it will show resource under **default** namespace.
<br>
We can use `kubectl get` to retrieve existing resource under certain namespace. For instance, kubectl get deployment, pods, configmap, namespace, secret, service, ingress etc.
<br>
Let's see some example:

First, create some deployment under the **default** namespace. No `-n` flag apply

```
kubectl create deployment dummy --image=nginx 
```{{copy}}

Let's try to the existing deployment resources and observe the output
```
kubectl get deploy                  # will only see the dummy deployment we just apply
kubectl get deploy -n web-server    # will only see nginx that we apply in previous section
kubectl get deploy -A               # will see all of the deployment name inside the cluster
```


<br>
The flag `-A` allow you to view that specific resource( e.g. deploy, pod, secret, configmap etc.) in every namespace inside the cluster

<br>
`-owide` and `-oyaml` are powerful flags to be use along with `kubectl get` as well. `-owide` will provide more details of that specific resource. While, `-oyaml` will get the resource in **yaml** definition file, which you can use to investigate configuration issue or apply it anywhere else.

```
# Get more detail on pods
kubectl get po -owide
kubectl get po -oyaml

# Get more details on deployment resource
kubectl get deploy dummy -owide
kubectl get deploy dummy -oyaml
```


