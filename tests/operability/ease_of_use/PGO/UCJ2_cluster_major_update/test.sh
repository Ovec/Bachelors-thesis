#!/bin/bash
kubectl apply -k "$(dirname "$(realpath "$0")")/pg-upgrade"
kubectl -n postgres-operator annotate postgrescluster hippo postgres-operator.crunchydata.com/allow-upgrade="hippo-upgrade"
kubectl apply -k "$(dirname "$(realpath "$0")")/cluster-shutdown"
sleep 420
kubectl apply -k "$(dirname "$(realpath "$0")")/cluster-start"
