# docker-socket-proxy
[![Build Status](https://img.shields.io/travis/demyxco/docker-socket-proxy?style=flat)](https://travis-ci.org/demyxco/docker-socket-proxy)
[![Docker Pulls](https://img.shields.io/docker/pulls/demyx/docker-socket-proxy?style=flat&color=blue)](https://hub.docker.com/r/demyx/docker-socket-proxy)
[![Architecture](https://img.shields.io/badge/linux-amd64-important?style=flat&color=blue)](https://hub.docker.com/r/demyx/docker-socket-proxy)
[![Alpine](https://img.shields.io/badge/alpine--informational?style=flat&color=blue)](https://hub.docker.com/r/demyx/docker-socket-proxy)
[![HAProxy](https://img.shields.io/badge/haproxy-1.9.16-informational?style=flat&color=blue)](https://hub.docker.com/r/demyx/docker-socket-proxy)
[![Buy Me A Coffee](https://img.shields.io/badge/buy_me_coffee-$5-informational?style=flat&color=blue)](https://www.buymeacoffee.com/VXqkQK5tb)
[![Become a Patron!](https://img.shields.io/badge/become%20a%20patron-$5-informational?style=flat&color=blue)](https://www.patreon.com/bePatron?u=23406156)

Docker image running Alpine Linux and modified version of [Tecnativa/docker-socket-proxy](https://github.com/Tecnativa/docker-socket-proxy).

DEMYX | DOCKER-SOCKET-PROXY
--- | ---
USER | demyx
PORT | 2375
ENTRYPOINT | sudo -E demyx-entrypoint

## Usage

*Notice: this example only shows you what would happen without passing any permissions via environment variables. To see all available permissions, please click the link below at the end of the examples.*

Run the API proxy (--privileged flag is required here because it connects with the docker socket, which is a privileged connection in some SELinux/AppArmor contexts and would get locked otherwise):
```
$ docker run \
    -d --privileged \
    --name=demyx_proxy \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -p 127.0.0.1:2375:2375 \
    demyx/docker-socket-proxy
```

Connect your local docker client to that socket:
```
$ export DOCKER_HOST=tcp://demyx_socket:2375
```

You can see the docker version:
```
$ docker version
Client:
 Version:      17.03.1-ce
 API version:  1.27
 Go version:   go1.7.5
 Git commit:   c6d412e
 Built:        Mon Mar 27 17:14:43 2017
 OS/Arch:      linux/amd64

Server:
 Version:      17.03.1-ce
 API version:  1.27 (minimum version 1.12)
 Go version:   go1.7.5
 Git commit:   c6d412e
 Built:        Mon Mar 27 17:14:43 2017
 OS/Arch:      linux/amd64
 Experimental: false
```

You cannot see running containers:
```
$ docker container ls
Error response from daemon: <html><body><h1>403 Forbidden</h1>
Request forbidden by administrative rules.
</body></html>
The same will happen to any containers that use this proxy's 2375 port to access the Docker socket API.
```

For more details: [Tecnativa/docker-socket-proxy](https://github.com/Tecnativa/docker-socket-proxy)

## Updates & Support
[![Code Size](https://img.shields.io/github/languages/code-size/demyxco/docker-socket-proxy?style=flat&color=blue)](https://github.com/demyxco/docker-socket-proxy)
[![Repository Size](https://img.shields.io/github/repo-size/demyxco/docker-socket-proxy?style=flat&color=blue)](https://github.com/demyxco/docker-socket-proxy)
[![Watches](https://img.shields.io/github/watchers/demyxco/docker-socket-proxy?style=flat&color=blue)](https://github.com/demyxco/docker-socket-proxy)
[![Stars](https://img.shields.io/github/stars/demyxco/docker-socket-proxy?style=flat&color=blue)](https://github.com/demyxco/docker-socket-proxy)
[![Forks](https://img.shields.io/github/forks/demyxco/docker-socket-proxy?style=flat&color=blue)](https://github.com/demyxco/docker-socket-proxy)

* Auto built weekly on Saturdays (America/Los_Angeles)
* Rolling release updates
* For support: [#demyx](https://webchat.freenode.net/?channel=#demyx)
