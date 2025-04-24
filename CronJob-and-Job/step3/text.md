
---

### `step3.md`: Create a CronJob

```markdown
# Step 3: Automate with a CronJob

Now you’ll schedule a **CronJob** to run every minute for testing.

📄 `manifests/cronjob-basic.yaml`:
```yaml
apiVersion: batch/v1
kind: CronJob
metadata:
  name: ping-cronjob
spec:
  schedule: "*/1 * * * *"
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: pinger
            image: busybox
            command: ["sh", "-c", "echo Cron run at $(date)"]
          restartPolicy: OnFailure
