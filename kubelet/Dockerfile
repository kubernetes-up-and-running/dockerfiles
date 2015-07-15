FROM scratch
MAINTAINER Kelsey Hightower <kelsey.hightower@kuar.io>
COPY kubelet /kubelet
COPY pod.yaml /pod.yaml
ENTRYPOINT ["/kubelet"]
CMD ["--containerized", "--api-servers=http://127.0.0.1:8080", "--v=2", "--address=0.0.0.0", "--enable-server", "--hostname-override=127.0.0.1", "--config=/pod.yaml", "--machine-id-file=/rootfs/etc/machine-id", "--allow-privileged"]
