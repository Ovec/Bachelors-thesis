#!/bin/bash
wait_for_all_pods_in_namespace_running() {
    desired_state="Running"
    counter=0
    all_active=0

    while [[ "$counter" -lt 600 && "$all_active" == 0 ]]; do
        all_active=1

        statuses=$(kubectl -n postgres-operator get pods \
            -n "$1" \
            -o jsonpath='{.items[*].status.phase}' | tr ' ' '\n')

        container_statuses=$(kubectl -n postgres-operator get pods \
            -n "$1" \
            -o jsonpath='{.items[*].status.containerStatuses[*].ready}' | tr ' ' '\n')

        not_running_pods=$(echo "$statuses" | grep -o -v "$desired_state" | wc -l)
        not_running_containers=$(echo "$container_statuses" | grep -o -v true | wc -l)

        if [ "$not_running_pods" -gt 0 ] || [ "$not_running_containers" -gt 0 ]; then
            all_active=0
            sleep 5
        fi
    done

    if [ "$all_active" == 0 ]; then
        echo "Error: all pods are not active"
        exit 1
    fi

}

wait_for_all_pods_in_namespace_running postgres-operator
