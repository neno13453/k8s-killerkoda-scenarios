It's always a good idea to clean up any resources that are no longer used.

Delete the pod of deployment `my-first-deployment` to observe the behaviour then delete the deployment `my-first-deployment` 


<br>
<details><summary>Solution</summary>
<br>

```plain
kubectl delete po <pod name>
kubectl delete deployment my-first-deployment
```

</details>

In Kubernetes, pod was managed by the reconsilation-loop meaning the pod will always have check the latest state of deployment and reconsile(will cause restart) if needed.