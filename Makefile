BINARIES=kube-apiserver/kube-apiserver \
	kube-controller-manager/kube-controller-manager \
	kube-proxy/kube-proxy \
	kube-scheduler/kube-scheduler \
	etcd/etcd \
	etcd/etcdctl

download: fetch-etcd-release fetch-kubernetes-release

fetch-kubernetes-release:
	curl -o kubernetes.tar.gz \
	-L https://github.com/GoogleCloudPlatform/kubernetes/releases/download/v1.1.2/kubernetes.tar.gz
	tar -xvzf kubernetes.tar.gz kubernetes/server/kubernetes-server-linux-amd64.tar.gz
	tar -xvzf kubernetes/server/kubernetes-server-linux-amd64.tar.gz

fetch-etcd-release:
	curl -o etcd-v2.2.2-linux-amd64.tar.gz \
	-L https://github.com/coreos/etcd/releases/download/v2.2.2/etcd-v2.2.2-linux-amd64.tar.gz
	tar -xvf etcd-v2.2.2-linux-amd64.tar.gz

docker:
	docker build -t b.gcr.io/kuar/etcd:2.2.2 etcd/
	docker build -t b.gcr.io/kuar/kube-apiserver:1.1.2 kube-apiserver/
	docker build -t b.gcr.io/kuar/kube-controller-manager:1.1.2 kube-controller-manager/
	docker build -t b.gcr.io/kuar/kube-proxy:1.1.2 kube-proxy/
	docker build -t b.gcr.io/kuar/kube-scheduler:1.1.2 kube-scheduler/
	docker build -t b.gcr.io/kuar/kubelet:1.1.2 kube-scheduler/

docker-push:
	gcloud docker push b.gcr.io/kuar/etcd:2.2.2
	gcloud docker push b.gcr.io/kuar/kube-apiserver:1.1.2
	gcloud docker push b.gcr.io/kuar/kube-controller-manager:1.1.2
	gcloud docker push b.gcr.io/kuar/kube-proxy:1.1.2
	gcloud docker push b.gcr.io/kuar/kube-scheduler:1.1.2

.PHONY: kubernetes
kubernetes:
	cp kubernetes/server/bin/kube-apiserver kube-apiserver/
	cp kubernetes/server/bin/kube-controller-manager kube-controller-manager/
	cp kubernetes/server/bin/kube-proxy kube-proxy/
	cp kubernetes/server/bin/kube-scheduler kube-scheduler/
	chmod 755 kube-apiserver/kube-apiserver
	chmod 755 kube-controller-manager/kube-controller-manager
	chmod 755 kube-proxy/kube-proxy
	chmod 755 kube-scheduler/kube-scheduler

.PHONY: etcd
etcd:
	cp etcd-v2.2.2-linux-amd64/etcd etcd/etcd
	cp etcd-v2.2.2-linux-amd64/etcdctl etcd/etcdctl
	chmod 755 etcd/etcd
	chmod 755 etcd/etcdctl

.PHONY: clean
clean:
	rm -f $(BINARIES)
	rm -rf etcd-*-linux-amd64*
	rm -f kubernetes.tar.gz
	rm -rf kubernetes
