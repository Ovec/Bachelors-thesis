#!/bin/bash
helm uninstall prometheus-community prometheus-community/kube-prometheus-stack --namespace monitoring
kubectl delete ns monitoring
