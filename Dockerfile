FROM alpine:3.11
MAINTAINER Erlend Aakre <erlend@frostvoid.com>

COPY murmur.ini /etc/murmur.tpl
ENV MURMUR_ALPINE_VERSION 1.3.0-r4

RUN apk add --no-cache \
	murmur>=$MURMUR_ALPINE_VERSION \
	qt5-qtbase-mysql

RUN set -eux; \
	addgroup mumble; \
	adduser -h /home/mumble -s /sbin/nologin -D -G mumble mumble; \
	mkdir -p /data; \
	chown -R mumble \
		/data \
		/etc/murmur.tpl \
		/home/mumble

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

VOLUME ["/data"]
USER mumble

EXPOSE 64738 64738/udp
CMD ["/usr/bin/murmurd", "-fg", "-ini", "/data/murmur.ini"]
