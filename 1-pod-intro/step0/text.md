
> Get familiar with `kubectl` command.

https://kubernetes.io/docs/reference/kubectl/

Create a pod called `my-pod` of image `nginx:alpine`

<br>
<details><summary>Solution</summary>
<br>

```plain
k run my-pod --image=nginx:alpine
```{{exec}}

</details>
