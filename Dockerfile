FROM tecnativa/docker-socket-proxy

LABEL sh.demyx.image demyx/docker-socket-proxy
LABEL sh.demyx.maintainer Demyx <info@demyx.sh>
LABEL sh.demyx.url https://demyx.sh
LABEL sh.demyx.github https://github.com/demyxco
LABEL sh.demyx.registry https://hub.docker.com/u/demyx

# Remove all binaries
RUN set -ex; \
	mv /usr/local/sbin/haproxy /; \
	rm -rf /usr/local/bin; \
	rm -rf /usr/local/sbin; \
	rm -rf /usr/sbin; \
	rm -rf /usr/bin; \
	rm -rf /sbin; \
	rm -rf /bin

# Set PATH to null
ENV PATH=

ENTRYPOINT ["/haproxy", "-W", "-db", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]
