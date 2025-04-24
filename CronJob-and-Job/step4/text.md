
---

### `step4.md`: Simulate failure & retry

```markdown
# Step 4: Simulate Failure and Retry Behavior

Let’s simulate a failing CronJob and configure retry behavior.

📄 `manifests/cronjob-failure.yaml`:
```yaml
apiVersion: batch/v1
kind: CronJob
metadata:
  name: fail-cronjob
spec:
  schedule: "*/1 * * * *"
  jobTemplate:
    spec:
      backoffLimit: 2
      template:
        spec:
          containers:
          - name: failer
            image: busybox
            command: ["sh", "-c", "exit 1"]
          restartPolicy: OnFailure
