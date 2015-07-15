FROM scratch
MAINTAINER Kelsey Hightower <kelsey.hightower@kuar.io>
COPY kube-scheduler /kube-scheduler
VOLUME ["/etc/kubernetes", "/etc/ssl/certs"]
ENTRYPOINT ["/kube-scheduler"]
