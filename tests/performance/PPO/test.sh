#!/bin/bash
USER=pguser
PASSWORD=$(kubectl get secret postgres-pguser-secret --namespace pgo -o jsonpath='{.data.password}' | base64 --decode)
DB_NAME=pgdb

kubectl exec -it pg-bench-0 -- env PGPASSWORD="$PASSWORD" pgbench -h postgres-pgbouncer.pgo.svc.cluster.local -U "$USER" -i "$DB_NAME"

clear
kubectl exec -it pg-bench-0 -- env PGPASSWORD="$PASSWORD" pgbench -h postgres-pgbouncer.pgo.svc.cluster.local -U "$USER" -t 10000 -c 25 -j 10 "$DB_NAME"
kubectl exec -it pg-bench-0 -- env PGPASSWORD="$PASSWORD" pgbench -h postgres-pgbouncer.pgo.svc.cluster.local -U "$USER" -t 10000 -c 25 -j 10 "$DB_NAME"
kubectl exec -it pg-bench-0 -- env PGPASSWORD="$PASSWORD" pgbench -h postgres-pgbouncer.pgo.svc.cluster.local -U "$USER" -t 10000 -c 25 -j 10 "$DB_NAME"
