#!/bin/bash
kubectl delete -k ./patch
kubectl apply -k ../UCB1_cluster_installation/postgres
