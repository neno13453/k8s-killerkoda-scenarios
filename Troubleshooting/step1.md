
> For Kubernetes troubleshooting, mostly there are 2 commands that we will use; `kubectl describe po <podname>` and `kubectl logs -p <podname>`. The logs and events will provide every detail you need
<br>

Try to check the current state of each pod by running
```
kubectl get po
```{{copy}}

Then, try to fix the issue accordingly by editing deployment resources

<br>
<details><summary>Hint: use below command to edit the existing resource</summary>
<br>
```
kubectl edit deploy <deployment name>
```{{copy}}
</details>