#!/bin/bash
kubectl delete -k ../patch_14_7
kubectl apply -k ../UCB1_cluster_installation/postgres
