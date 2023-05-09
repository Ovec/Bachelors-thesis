#!/bin/bash
kubectl edit configmap postgres-pgbouncer-cm -n pgo
kubectl delete pod -l crunchy-pgbouncer=true -n pgo
