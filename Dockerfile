FROM tecnativa/docker-socket-proxy

LABEL sh.demyx.image 				demyx/docker-socket-proxy
LABEL sh.demyx.maintainer 			Demyx <info@demyx.sh>
LABEL sh.demyx.url 					https://demyx.sh
LABEL sh.demyx.github 				https://github.com/demyxco
LABEL sh.demyx.registry 			https://hub.docker.com/u/demyx

# Set default variables
ENV DEMYX							/demyx
ENV DEMYX_CONFIG					/etc/demyx
ENV DEMYX_LOG						/var/log/demyx
ENV TZ								America/Los_Angeles
# Support for old variables
ENV DOCKER_SOCKET_PROXY_ROOT     	/demyx
ENV DOCKER_SOCKET_PROXY_CONFIG   	/etc/demyx
ENV DOCKER_SOCKET_PROXY_LOG      	/var/log/demyx

# Configure Demyx
RUN set -ex; \
    /usr/sbin/addgroup -g 1000 -S demyx; \
    /usr/sbin/adduser -u 1000 -D -S -G demyx demyx; \
    \
    /usr/bin/install -d -m 0755 -o demyx -g demyx "$DEMYX"; \
    /usr/bin/install -d -m 0755 -o demyx -g demyx "$DEMYX_CONFIG"; \
    /usr/bin/install -d -m 0755 -o demyx -g demyx "$DEMYX_LOG"

# Packages
RUN set -ex; \
	/sbin/apk --update --no-cache add bash sudo

# Configure sudo
RUN set -ex; \
	/bin/echo "demyx ALL=(ALL) NOPASSWD:SETENV: /usr/local/bin/demyx-entrypoint" > /etc/sudoers.d/demyx

# Finalize
RUN set -ex; \
	# Lockdown
	/bin/chmod o-x /bin/busybox; \
	\
	# Create entrypoint
	/bin/echo "#!/bin/bash" > /usr/local/bin/demyx-entrypoint; \
	/bin/echo "/usr/local/sbin/haproxy -W -db -f /usr/local/etc/haproxy/haproxy.cfg" >> /usr/local/bin/demyx-entrypoint; \
	\
	chmod +x /usr/local/bin/demyx-entrypoint

USER demyx

ENTRYPOINT ["/usr/bin/sudo", "-E", "/usr/local/bin/demyx-entrypoint"]
