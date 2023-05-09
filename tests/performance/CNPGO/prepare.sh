#!/bin/bash
kubectl apply -f config/operator/install.yaml
kubectl create ns postgres-operator
sleep 60
kubectl apply -k config/cluster
