FROM debian:jessie
MAINTAINER Kelsey Hightower <kelsey.hightower@kuar.io>
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    iptables \
    util-linux
# Make nsenter available at / for the kubelet in a container hack.
RUN ln -s /usr/bin/nsenter /nsenter

COPY kubelet /kubelet
ENTRYPOINT ["/kubelet"]
