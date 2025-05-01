Let’s simulate a change by upgrading the release with a custom value by running helm upgrade with `--set image.tag=xxxx`.

<br>
<details><summary>Tip</summary>
<br>

```plain
helm upgrade -h
```

</details>

<br>

<details><summary>Solution</summary>
<br>

```plain
helm upgrade --install grafana grafana/grafana --set image.tag=xxxx
```

</details>

<br>
You will notice that pod is crashing
