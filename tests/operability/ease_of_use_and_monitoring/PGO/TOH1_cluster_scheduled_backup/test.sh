#!/bin/bash
# Operator from step TOA1_operator_installation must be installed
# Cluster from step TOD1_cluster_installation must be installed
kubectl apply -k ./patch
