#!/bin/bash
kubectl apply -k config/operator/namespace
kubectl apply --server-side -k config/operator/default
sleep 60
kubectl apply -k config/cluster
