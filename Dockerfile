FROM tecnativa/docker-socket-proxy

LABEL sh.demyx.image 				demyx/docker-socket-proxy
LABEL sh.demyx.maintainer 			Demyx <info@demyx.sh>
LABEL sh.demyx.url 					https://demyx.sh
LABEL sh.demyx.github 				https://github.com/demyxsh
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

# Packages
RUN set -ex; \
	apk --update --no-cache add bash sudo

# Configure Demyx
RUN set -ex; \
    # Create demyx user
    addgroup -g 1000 -S demyx; \
    adduser -u 1000 -D -S -G demyx demyx; \
    \
    # Create demyx directories
    install -d -m 0755 -o demyx -g demyx "$DEMYX"; \
    install -d -m 0755 -o demyx -g demyx "$DEMYX_CONFIG"; \
    install -d -m 0755 -o demyx -g demyx "$DEMYX_LOG"; \
    \
    # Update .bashrc
    echo 'PS1="$(whoami)@\h:\w \$ "' > /home/demyx/.bashrc; \
    echo 'PS1="$(whoami)@\h:\w \$ "' > /root/.bashrc

# Configure sudo
RUN set -ex; \
	echo "demyx ALL=(ALL) NOPASSWD:SETENV: /usr/local/bin/demyx-entrypoint" > /etc/sudoers.d/demyx

# Finalize
RUN set -ex; \
	# Lockdown
	chmod o-x /bin/busybox; \
	\
	# Create entrypoint
    ./docker-entrypoint.sh \
	echo "#!/bin/bash" > /usr/local/bin/demyx-entrypoint; \
	echo "haproxy -W -db -f /usr/local/etc/haproxy/haproxy.cfg" >> /usr/local/bin/demyx-entrypoint; \
	\
	chmod +x /usr/local/bin/demyx-entrypoint

USER demyx

ENTRYPOINT ["sudo", "-E", "demyx-entrypoint"]
