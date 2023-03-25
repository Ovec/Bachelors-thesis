#!/bin/bash
source ../../utilities/pods/get_podname_by_selector.sh
source ../../utilities/pods/wait_for_all_pods_in_namespace_running.sh

# Deploy upgrade
kubectl apply -k ./pg-upgrade

# Cluster shutdown
kubectl apply -k ./high-availability-shutdown

# Cluster annotate
kubectl -n postgres-operator annotate postgrescluster hippo-ha postgres-operator.crunchydata.com/allow-upgrade="hippo-upgrade"

counter=0
status=""

while [[ "$counter" -lt 600 ]]; do
    echo "$counter"
    status=$(kubectl get pgupgrade hippo-upgrade -n postgres-operator -o jsonpath='{.status.conditions[-1:].type}')
    if test "$status" != "Succeeded"; then
        sleep 5
    else
        break
    fi
done

if test "$status" != "Succeeded"; then
    echo "Error: unable to upgrade cluster to new version"
    exit 1
else
    # Start cluster againe
    kubectl apply -k ./high-availability-start
    sleep 5
    wait_for_all_pods_in_namespace_running "postgres-operator"

    # test postgres db
    echo "Success"
    exit 0
fi
