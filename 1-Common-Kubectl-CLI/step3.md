> In case, pod are not successfully deploy or become unhealthy `kubectl logs` and `kubectl decribe` will be come handy.
<br>

We can use `kubectl logs` to directly view any logs of that particular pod without additional observabitiy tools. Please note that, logs can only perform on **pods** level
```
kubectl logs <pod name>
```

Additionally, `kubectl describe` will show the events occurred with that specific resource. For example, pod pulling image from public registry or pod craashing due to OOM.
```
kubectl describe pod <pod name>
```
