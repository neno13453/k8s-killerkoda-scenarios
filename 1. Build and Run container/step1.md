
> You can either use "docker" or "podman" CLI. 
<br>
> In Accenture laptop, "Docker" is not allow due to licensing. Therefore, you need to replace "docker" with "podman" command. Though, all of the command are exactly the same


Create a new file '/tmp/Dockerfile' to build a container image from. It should:

<li> test
use 'bash' as base
run 'ping google.com'




```
docker run -p 80:80 nginx:alpine
```{{exec}}


Or run it in background:

```
docker run -d -p 80:80 nginx:alpine
```{{exec}}

Now access Nginx using this link:

[ACCESS NGINX]({{TRAFFIC_HOST1_80}})

It's also possible to access ports using the top-right navigation in the terminal.
Or we can display the link to that page:

[ACCESS PORTS]({{TRAFFIC_SELECTOR}})

It's also possible to generate access URLs in bash (foreground or background scripts) like this:

```
sed 's/PORT/80/g' /etc/killercoda/host
```{{exec}}
