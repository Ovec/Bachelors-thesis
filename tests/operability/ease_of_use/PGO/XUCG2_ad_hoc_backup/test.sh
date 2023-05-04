#!/bin/bash
kubectl apply -k "$(dirname "$(realpath "$0")")/update"
# kubectl annotate -n postgres-operator postgrescluster hippo-ha --overwrite postgres-operator.crunchydata.com/pgbackrest-backup="$(date)"
# kubectl annotate -n postgres-operator postgrescluster hippo-ha --overwrite postgres-operator.crunchydata.com/pgbackrest-backup="$(date)"
