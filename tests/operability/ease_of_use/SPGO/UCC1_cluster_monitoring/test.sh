#!/bin/bash
# Install prometheus grafana stack
kubectl create ns monitoring
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install prometheus-community prometheus-community/kube-prometheus-stack --namespace monitoring
