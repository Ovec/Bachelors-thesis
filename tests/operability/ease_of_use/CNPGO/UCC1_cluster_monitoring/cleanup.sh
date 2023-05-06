#!/bin/bash
helm uninstall prometheus-community --namespace postgres-operator
kubectl delete -k ./prometheus_stack
kubectl apply -k ../UCB1_cluster_installation/postgres
