
> You can either use `docker` or `podman` CLI. 
<br>
> In Accenture laptop, "Docker" is not allow due to licensing. Therefore, you need to replace "docker" with "podman" command. Though, all of the command are exactly the same


Create a new file `~/step2/Dockerfile` to build a container image from.

```
FROM golang:1.23
WORKDIR /src
COPY ~/main.go main.go
RUN go build -o /bin/hello ./main.go

FROM scratch
COPY --from=0 /bin/hello /bin/hello
CMD ["/bin/hello"]
```{{copy}}

Build Docker image:
``` 
docker build -t hello-go-multi-stage:v0.1 step2/
```{{copy}}

Compare newly created Image and compare the size between normal build and multi-stages build
```
docker images | grep hello-go
```{{copy}}