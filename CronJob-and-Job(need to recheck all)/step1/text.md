
First, let’s run a **one-time job** that prints a message and exits.

`manifests/job-simple.yaml`:
```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: hello-job
spec:
  template:
    spec:
      containers:
      - name: hello
        image: busybox
        command: ['sh', '-c', 'echo "Hello from Finlytics!"']
      restartPolicy: Never
```
