#!/bin/bash
kubectl delete -k ./patch
kubectl apply -k ../TOB1_cluster_installation/postgres
