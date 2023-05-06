#!/bin/bash
# Install prometheus grafana stack
kubectl apply -k ./patch
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm upgrade --install -f ./prometheus_stack/install.yaml prometheus-community prometheus-community/kube-prometheus-stack --namespace postgres-operator
# Installing rules
kubectl apply -k ./prometheus_stack
