
> As they are so many Kubernetes resources, it's troublesome to manage or apply these resources individually. That's when Helm come into play. Helm is a package manager for Kubernetes that helps you define, install, and manage Kubernetes applications.
<br>


Deploy the whole Grafana application using Helm from repo https://grafana.github.io/helm-charts:

<br>
<details><summary>Hint:</summary>
<br>

```
# To Helm to local repo
helm repo add <application name> <repo url>    

# To update Helm repo to ensure it's latest state
helm repo update

# To install
helm install <release name> <application name>/<application name>
```
</details>

<br>
<details><summary>Solution:</summary>
<br>

```
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm install grafana grafana/grafana
```{{copy}}
</details>

<br>

Try `kubectl get all` to see all of the Kubernetes resources deploy with Grafana via Helm

Wait until pod is in running state, then start kubectl forward, so you will able to access the UI:

```plain
kubectl port-forward --address 0.0.0.0 service/grafana 3000:80
```{{copy}}

Now access it via

[ACCESS Grafana]({{TRAFFIC_HOST1_3000}})

It's also possible to access ports using the top-right navigation in the terminal.
Or we can display the link to that page:

[ACCESS PORTS]({{TRAFFIC_SELECTOR}})



