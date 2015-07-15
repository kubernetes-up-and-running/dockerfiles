FROM scratch
MAINTAINER Kelsey Hightower <kelsey.hightower@kuar.io>
COPY kube-controller-manager /kube-controller-manager
VOLUME ["/etc/kubernetes", "/etc/ssl/certs"]
ENTRYPOINT ["/kube-controller-manager"]
