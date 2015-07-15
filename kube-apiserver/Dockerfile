FROM scratch
MAINTAINER Kelsey Hightower <kelsey.hightower@kuar.io>
COPY kube-apiserver /kube-apiserver
VOLUME ["/etc/kubernetes", "/etc/ssl/certs", "/var/run/kubernetes"]
ENTRYPOINT ["/kube-apiserver"]
