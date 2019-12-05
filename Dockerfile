FROM tecnativa/docker-socket-proxy

LABEL sh.demyx.image demyx/docker-socket-proxy
LABEL sh.demyx.maintainer Demyx <info@demyx.sh>
LABEL sh.demyx.url https://demyx.sh
LABEL sh.demyx.github https://github.com/demyxco
LABEL sh.demyx.registry https://hub.docker.com/u/demyx

# Lockdown
RUN set -ex; \
	rm -f /bin/sh; \
	rm -f /bin/ash; \
	rm -f /usr/bin/wget

ENTRYPOINT ["haproxy", "-W", "-db", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]
