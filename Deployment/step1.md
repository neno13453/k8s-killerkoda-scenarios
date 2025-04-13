
> You can either use `docker` or `podman` CLI. 
<br>
> In Accenture laptop, "Docker" is not allow due to licensing. Therefore, you need to replace "docker" with "podman" command. Though, all of the command are exactly the same


Create a new file `~/step1/Dockerfile` to build a container image from.

```
FROM golang:1.23
WORKDIR /src
COPY main.go main.go
RUN go build -o /bin/hello ./main.go
CMD ["/bin/hello"]
```{{copy}}

Build Docker image:
``` 
docker build -t hello-go:v0.1 step1/
```{{copy}}

Checking newly created image
```
docker images | grep hello-go
```{{copy}}