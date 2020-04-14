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
    addgroup -g 1000 -S demyx; \
    adduser -u 1000 -D -S -G demyx demyx; \
    \
    install -d -m 0755 -o demyx -g demyx "$DOCKER_SOCKET_PROXY_ROOT"; \
    install -d -m 0755 -o demyx -g demyx "$DOCKER_SOCKET_PROXY_CONFIG"; \
    install -d -m 0755 -o demyx -g demyx "$DOCKER_SOCKET_PROXY_LOG"

# Main packages
RUN set -ex; \
	apk --no-cache add dumb-init sudo

# Configure sudo
RUN set -ex; \
	echo "demyx ALL=(ALL) NOPASSWD: /usr/local/bin/demyx-entrypoint" > /etc/sudoers.d/demyx; \
	echo 'Defaults env_keep +="AUTH"' >> /etc/sudoers.d/demyx; \
	echo 'Defaults env_keep +="BUILD"' >> /etc/sudoers.d/demyx; \
	echo 'Defaults env_keep +="COMMIT"' >> /etc/sudoers.d/demyx; \
	echo 'Defaults env_keep +="CONFIGS"' >> /etc/sudoers.d/demyx; \
	echo 'Defaults env_keep +="CONTAINERS"' >> /etc/sudoers.d/demyx; \
	echo 'Defaults env_keep +="DISTRIBUTION"' >> /etc/sudoers.d/demyx; \
	echo 'Defaults env_keep +="EVENTS"' >> /etc/sudoers.d/demyx; \
	echo 'Defaults env_keep +="EXEC"' >> /etc/sudoers.d/demyx; \
	echo 'Defaults env_keep +="IMAGES"' >> /etc/sudoers.d/demyx; \
	echo 'Defaults env_keep +="INFO"' >> /etc/sudoers.d/demyx; \
	echo 'Defaults env_keep +="NETWORKS"' >> /etc/sudoers.d/demyx; \
	echo 'Defaults env_keep +="NODES"' >> /etc/sudoers.d/demyx; \
	echo 'Defaults env_keep +="PING"' >> /etc/sudoers.d/demyx; \
	echo 'Defaults env_keep +="PLUGINS"' >> /etc/sudoers.d/demyx; \
	echo 'Defaults env_keep +="POST"' >> /etc/sudoers.d/demyx; \
	echo 'Defaults env_keep +="SECRETS"' >> /etc/sudoers.d/demyx; \
	echo 'Defaults env_keep +="SERVICES"' >> /etc/sudoers.d/demyx; \
	echo 'Defaults env_keep +="SESSION"' >> /etc/sudoers.d/demyx; \
	echo 'Defaults env_keep +="SWARM"' >> /etc/sudoers.d/demyx; \
	echo 'Defaults env_keep +="SYSTEM"' >> /etc/sudoers.d/demyx; \
	echo 'Defaults env_keep +="TASKS"' >> /etc/sudoers.d/demyx; \
	echo 'Defaults env_keep +="VERSION"' >> /etc/sudoers.d/demyx; \
	echo 'Defaults env_keep +="VOLUMES"' >> /etc/sudoers.d/demyx; \
	\
	# Create entrypoint
	echo "#!/usr/bin/dumb-init /bin/sh" > /usr/local/bin/demyx-entrypoint; \
	echo "haproxy -W -db -f /usr/local/etc/haproxy/haproxy.cfg" >> /usr/local/bin/demyx-entrypoint; \
	\
	chmod +x /usr/local/bin/demyx-entrypoint

USER demyx

ENTRYPOINT ["sudo", "demyx-entrypoint"]
