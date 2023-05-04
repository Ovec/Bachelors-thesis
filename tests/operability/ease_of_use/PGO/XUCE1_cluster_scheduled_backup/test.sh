#!/bin/bash
# Operator from step UCA1_operator_installation must be installed
# Cluster from step UCD1_cluster_installation must be installed
kubectl apply -k "$(dirname "$(realpath "$0")")/install"
