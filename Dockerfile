FROM alpine:latest
MAINTAINER Erlend Aakre <erlend@frostvoid.com>

COPY murmur.ini /etc/murmur.tpl
COPY init.sh /usr/bin/init.sh

# TODO set up mumble user

RUN mkdir -p /data
RUN apk upgrade --update-cache --available
RUN apk --no-cache add murmur

VOLUME ["/data"]

EXPOSE 64738 64738/udp

CMD ["/usr/bin/init.sh"]

