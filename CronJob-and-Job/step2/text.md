
---

### `step2.md`: Observe completions & retries

```markdown
# Step 2: Observe Completions and Re-runs

Let’s explore how Jobs behave with **multiple completions** and how **backoffLimit** works.

📄 Modify the job to run 3 times:
```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: repeat-job
spec:
  completions: 3
  parallelism: 1
  template:
    spec:
      containers:
      - name: worker
        image: busybox
        command: ['sh', '-c', 'echo "Task done by $(hostname)"']
      restartPolicy: Never
