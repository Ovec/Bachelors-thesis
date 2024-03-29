#!/bin/bash
kubectl apply -k "$(dirname "$(realpath "$0")")/pg-upgrade"
sleep 10
kubectl -n postgres-operator annotate postgrescluster hippo postgres-operator.crunchydata.com/allow-upgrade="hippo-upgrade"
sleep 10
kubectl apply -k "$(dirname "$(realpath "$0")")/cluster-shutdown"
sleep 420
kubectl apply -k "$(dirname "$(realpath "$0")")/cluster-start"
