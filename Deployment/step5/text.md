For Kubernetes best-practice, you will need to set resource allocation on your `my-first-deployment`. Based on the forcase, this deployment will require at least `50m` cpu and memory not more that `256Mi`


<br>
<details><summary>Solution</summary>
<br>
Add the following configuration under "spec.template.spec.containers.resources:"


```plain
resources:
    requests:
        memory: "256Mi"
        cpu: "50m"
    limits:
        memory: "256Mi"
```

You will notice that we will not set CPU limit as it could cause performance degraded. Furthermore, we will set the memory request/limit exactly the same as per Kubernetes best practice

</details>