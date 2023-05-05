#!/bin/bash
kubectl apply -k ./patch
kubectl annotate -n postgres-operator postgrescluster hippo --overwrite postgres-operator.crunchydata.com/pgbackrest-restore=id1
