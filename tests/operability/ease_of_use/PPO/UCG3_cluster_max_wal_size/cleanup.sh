#!/bin/bash
kubectl delete configmap custom-config -n pgo
kubectl apply -k "../UCB1_cluster_installation/postgres"
