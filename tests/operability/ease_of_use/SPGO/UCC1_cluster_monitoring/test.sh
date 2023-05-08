#!/bin/bash
# Install prometheus grafana stack

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install prometheus-community prometheus-community/kube-prometheus-stack --namespace stackgres

# helm install --create-namespace --namespace monitoring prometheus prometheus-community/kube-prometheus-stack --set grafana.enabled=true --version 12.10.6

# kubectl apply -k ./patch
# helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
# helm upgrade --install -f ./prometheus_stack/install.yaml prometheus-community prometheus-community/kube-prometheus-stack --namespace postgres-operator
# Installing rules
# kubectl apply -k ./prometheus_stack
