
📄 `manifests/cronjob-advanced.yaml`:
```yaml
apiVersion: batch/v1
kind: CronJob
metadata:
  name: controlled-cronjob
spec:
  schedule: "*/1 * * * *"
  concurrencyPolicy: Forbid
  successfulJobsHistoryLimit: 1
  failedJobsHistoryLimit: 1
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: demo
            image: busybox
            command: ["sh", "-c", "echo Start $(date); sleep 90"]
          restartPolicy: OnFailure
```