
---

### `step5.md`: Control concurrency & history

```markdown
# Step 5: Concurrency and Job History Management

Let’s explore how to control concurrent jobs and manage job history.

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
