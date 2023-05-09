#!/bin/bash
kubectl create namespace pgo
kubectl config set-context "$(kubectl config current-context)" --namespace=pgo
kubectl apply -k install
