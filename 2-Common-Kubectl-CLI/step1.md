> Creating a Pod using `kubectl create`. You can type `kubectl create` to see list of options that can easily create,


Let’s start by launching an `nginx` under web-server **namespace** using a **Deployment** resource.

First of, create the namespace from yaml file at `/tmp/namespace.yaml` - It's a good practice to separate resources into different namespace depending on workload or environment.

```
kubectl apply -f /tmp/namespace.yaml
```{{copy}}

Then proceed to create the nginx deployment with below command `-n` is a flag referring to target namespace that you want to apply.

```
kubectl create deployment nginx --image=nginx -n web-server
```{{copy}}

Next, let's create some **Configmap** map and **Secret** to store configuration and secret.

```
kubectl create secret generic database-secret --from-literal=username=admin --from-literal=password=1234 -n web-server
kubectl create configmap my-config --from-literal=key1=config1 --from-literal=key2=config2 -n web-server
```{{copy}}


Validate that nginx deployment, pod(to ensure that it's running), configmap and secret is sucessfully created
```
kubectl get namespace
kubectl get deploy -n web-server
kubectl get pod -n web-server
kubectl get cm -n web-server
kubectl get secret -n web-server
```{{copy}}

Note: More hands-on related to deployment, secret and configmap will part of its own section