#!/bin/bash
kubectl apply -k "../UCB1_cluster_installation/postgres"
kubectl delete -k "$(dirname "$(realpath "$0")")/monitoring"
