We already go through some Helm basics command and scenarios. 

Now let's uninstall the `grafana` to clean up the environment using `helm` CLI

Once uninstalled, please confirm that all resource have been removed

```

helm ls
kubectl get all
```

<br>
<details><summary>Solution</summary>
<br>

```plain

helm uninstall grafana

```

</details>
