#!/bin/bash
kubectl apply -k ./patch
kubectl annotate -n postgres-operator postgrescluster hippo postgres-operator.crunchydata.com/pgbackrest-backup="$(date)" --overwrite
