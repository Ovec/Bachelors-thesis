#!/bin/bash
kubectl delete configmap custom-config -n pgo
kubectl apply -k "../TOB1_cluster_installation/postgres"
