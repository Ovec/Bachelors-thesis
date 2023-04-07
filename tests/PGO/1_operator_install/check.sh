#!/bin/bash
parent_dir="$(dirname "$0")"
source "$parent_dir/../../utilities/pods/wait_for_all_pods_in_namespace_running.sh"

kubectl apply -k "$parent_dir/namespace"

kubectl apply --server-side -k "$parent_dir/default"

sleep 5
wait_for_all_pods_in_namespace_running "postgres-operator"

echo "Success"
exit 0
