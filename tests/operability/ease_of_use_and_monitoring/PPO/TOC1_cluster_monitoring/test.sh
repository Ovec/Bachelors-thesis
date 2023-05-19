#!/bin/bash
kubectl apply -k patch
kubectl apply -k pmm-server
helm repo add percona https://percona.github.io/percona-helm-charts/
sleep 10
helm install pmm --set secret.create=false --set secret.name=pmm-secret percona/pmm
