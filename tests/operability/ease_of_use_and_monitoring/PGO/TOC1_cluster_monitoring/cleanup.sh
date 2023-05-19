#!/bin/bash
kubectl apply -k "../TOB1_cluster_installation/postgres"
kubectl delete -k "$(dirname "$(realpath "$0")")/monitoring"
