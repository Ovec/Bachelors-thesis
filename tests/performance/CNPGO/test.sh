#!/bin/bash
USER=app
PASSWORD=$(kubectl get secret postgres-app --namespace postgres-operator -o jsonpath='{.data.password}' | base64 --decode)
DB_NAME=app

kubectl exec -it pg-bench-0 -- env PGPASSWORD="$PASSWORD" pgbench -h pooler.postgres-operator.svc.cluster.local -U "$USER" -i "$DB_NAME"

clear
kubectl exec -it pg-bench-0 -- env PGPASSWORD="$PASSWORD" pgbench -h pooler.postgres-operator.svc.cluster.local -U "$USER" -t 10000 -c 25 -j 10 "$DB_NAME"
kubectl exec -it pg-bench-0 -- env PGPASSWORD="$PASSWORD" pgbench -h pooler.postgres-operator.svc.cluster.local -U "$USER" -t 10000 -c 25 -j 10 "$DB_NAME"
kubectl exec -it pg-bench-0 -- env PGPASSWORD="$PASSWORD" pgbench -h pooler.postgres-operator.svc.cluster.local -U "$USER" -t 10000 -c 25 -j 10 "$DB_NAME"
