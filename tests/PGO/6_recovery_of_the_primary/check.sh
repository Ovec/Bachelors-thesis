#!/bin/bash
source ../../utilities/pods/get_podname_by_selector.sh

primary=$(get_pod_name_by_selector \
    postgres-operator.crunchydata.com/role master)
standby=$(
    get_pod_name_by_selector \
        postgres-operator.crunchydata.com/role replica
)
kubectl delete pod "$primary" -n \
    postgres-operator
new_primary=$(
    get_pod_name_by_selector \
        postgres-operator.crunchydata.com/role master
)

counter=0
new_standby=""

while [[ "$counter" -lt 30 ]]; do
    new_standby=$(
        get_pod_name_by_selector \
            postgres-operator.crunchydata.com/role replica
    )
    if test "$new_standby" = ""; then
        sleep 1
    else
        break
    fi
done

if test "$standby" = "$new_primary" &&
    test "$primary" = "$new_standby"; then
    exit 0
else
    echo "Error: failover failed"
    exit 1
fi
