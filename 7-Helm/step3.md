From previous step, as the pod is crashing. We need to perform rollback to recover the microservices to previous revision.

You can perform rollback using details from these 2 command:

```
helm history -h
helm rollback -h
```


<br>
<details><summary>Solution</summary>
<br>

```plain
helm history grafana
# rollback grafana to revision that have been working
helm rollback grafana 1
```

</details>


<br>

Then, validate by checking the pod status of grafana and it should be running without any issue