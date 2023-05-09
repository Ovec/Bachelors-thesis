#!/bin/bash
USER=$(kubectl get secret hippo-pguser-hippo --namespace postgres-operator -o jsonpath='{.data.user}' | base64 --decode)
PASSWORD=$(kubectl get secret hippo-pguser-hippo --namespace postgres-operator -o jsonpath='{.data.password}' | base64 --decode)
DB_NAME=$(kubectl get secret hippo-pguser-hippo --namespace postgres-operator -o jsonpath='{.data.dbname}' | base64 --decode)
MASTER=$(kubectl get pods -n postgres-operator --selector="postgres-operator.crunchydata.com/cluster=hippo,postgres-operator.crunchydata.com/role=master" -o jsonpath='{.items[0].metadata.name}')

kubectl exec -it "$MASTER" -n postgres-operator -- psql hippo -c "GRANT ALL PRIVILEGES ON SCHEMA public TO hippo"
kubectl exec -it pg-bench-0 -- env PGPASSWORD="$PASSWORD" pgbench -h hippo-ha.postgres-operator.svc.cluster.local -U "$USER" -i "$DB_NAME"

clear
kubectl exec -it pg-bench-0 -- env PGPASSWORD="$PASSWORD" pgbench -h hippo-ha.postgres-operator.svc.cluster.local -U "$USER" -t 10000 -c 25 -j 10 "$DB_NAME"
kubectl exec -it pg-bench-0 -- env PGPASSWORD="$PASSWORD" pgbench -h hippo-ha.postgres-operator.svc.cluster.local -U "$USER" -t 10000 -c 25 -j 10 "$DB_NAME"
kubectl exec -it pg-bench-0 -- env PGPASSWORD="$PASSWORD" pgbench -h hippo-ha.postgres-operator.svc.cluster.local -U "$USER" -t 10000 -c 25 -j 10 "$DB_NAME"
