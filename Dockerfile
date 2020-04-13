FROM tecnativa/docker-socket-proxy

LABEL sh.demyx.image 		demyx/docker-socket-proxy
LABEL sh.demyx.maintainer 	Demyx <info@demyx.sh>
LABEL sh.demyx.url 			https://demyx.sh
LABEL sh.demyx.github 		https://github.com/demyxco
LABEL sh.demyx.registry 	https://hub.docker.com/u/demyx

# Set default variables
ENV DOCKER_SOCKET_PROXY_ROOT     	/demyx
ENV DOCKER_SOCKET_PROXY_CONFIG   	/etc/demyx
ENV DOCKER_SOCKET_PROXY_LOG      	/var/log/demyx
ENV TZ                      		America/Los_Angeles

# Configure Demyx
RUN set -ex; \
	rm -f /bin/sh; \
	rm -f /bin/ash; \
	rm -f /usr/bin/wget

ENTRYPOINT ["haproxy", "-W", "-db", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]
