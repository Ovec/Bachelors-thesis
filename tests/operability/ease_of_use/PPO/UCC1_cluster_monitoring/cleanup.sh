#!/bin/bash
kubectl delete -k patch
kubectl delete -k pmm-server
kubectl apply -k "../UCB1_cluster_installation/postgres"
