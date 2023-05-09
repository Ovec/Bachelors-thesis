#!/bin/bash
kubectl -n pgo create configmap custom-config --from-file=./config/config_map.yaml
kubectl apply -k patch
kubectl patch PerconaPGCluster postgres -p '{"spec":{"pause":false}}' --type=merge
