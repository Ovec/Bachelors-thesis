#!/bin/bash
get_pod_name_by_selector() {
    kubectl -n postgres-operator get pods \
        --selector="$1"="$2" \
        -o jsonpath='{.items[*].metadata.name}'
}
