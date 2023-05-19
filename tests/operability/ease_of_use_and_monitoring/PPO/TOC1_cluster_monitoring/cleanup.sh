#!/bin/bash
kubectl delete -k patch
kubectl delete -k pmm-server
kubectl apply -k "../TOB1_cluster_installation/postgres"
