#!/bin/bash
USER=postgres
PASSWORD=$(kubectl get secrets -n stackgres postgres -o jsonpath='{.data.superuser-password}' | base64 -d)
DB_NAME=postgres

kubectl exec -it pg-bench-0 -- env PGPASSWORD="$PASSWORD" pgbench -h postgres.stackgres.svc.cluster.local -U "$USER" -i "$DB_NAME"

clear
kubectl exec -it pg-bench-0 -- env PGPASSWORD="$PASSWORD" pgbench -h postgres.stackgres.svc.cluster.local -U "$USER" -t 10000 -c 25 -j 10 "$DB_NAME"
kubectl exec -it pg-bench-0 -- env PGPASSWORD="$PASSWORD" pgbench -h postgres.stackgres.svc.cluster.local -U "$USER" -t 10000 -c 25 -j 10 "$DB_NAME"
kubectl exec -it pg-bench-0 -- env PGPASSWORD="$PASSWORD" pgbench -h postgres.stackgres.svc.cluster.local -U "$USER" -t 10000 -c 25 -j 10 "$DB_NAME"
