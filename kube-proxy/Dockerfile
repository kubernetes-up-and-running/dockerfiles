FROM scratch
MAINTAINER Kelsey Hightower <kelsey.hightower@kuar.io>
COPY kube-proxy /kube-proxy
VOLUME ["/etc/kubernetes", "/etc/ssl/certs", "/usr/sbin/iptables", "/lib64"]
ENTRYPOINT ["/kube-proxy"]
