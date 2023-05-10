#!/bin/bash
helm repo add stackgres-charts https://stackgres.io/downloads/stackgres-k8s/stackgres/helm/
helm install --create-namespace --namespace stackgres --version 1.4.3 stackgres-operator stackgres-charts/stackgres-operator

kubectl apply -k config/config
sleep 5
kubectl apply -k config/cluster
