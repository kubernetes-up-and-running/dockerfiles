# Kubernetes Cluster with Docker

## Status: Work In Progress

The following guide will bootstrap a 6 node Kubernetes cluster using Docker and Docker Compose on GCE.

## Provision 6 GCE Nodes

```
for i in {0..5}; do
  gcloud compute instances create node${i} \
  --image-project coreos-cloud \
  --image coreos-alpha-723-0-0-v20150625 \
  --boot-disk-size 200GB \
  --machine-type n1-standard-1 \
  --can-ip-forward \
  --scopes compute-rw \
  --metadata-from-file user-data=node${i}.yaml
done
```

```
gcloud compute instances list
```

```
gcloud compute routes create default-route-10-200-0-0-24 --destination-range 10.200.0.0/24 --next-hop-instance node0
gcloud compute routes create default-route-10-200-1-0-24 --destination-range 10.200.1.0/24 --next-hop-instance node1
gcloud compute routes create default-route-10-200-2-0-24 --destination-range 10.200.2.0/24 --next-hop-instance node2
gcloud compute routes create default-route-10-200-3-0-24 --destination-range 10.200.3.0/24 --next-hop-instance node3
gcloud compute routes create default-route-10-200-4-0-24 --destination-range 10.200.4.0/24 --next-hop-instance node4
gcloud compute routes create default-route-10-200-5-0-24 --destination-range 10.200.5.0/24 --next-hop-instance node5
```

```
gcloud compute routes list
```
