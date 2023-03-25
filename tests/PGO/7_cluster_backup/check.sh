#!/bin/bash
source ../../utilities/pods/get_podname_by_selector.sh

cmd="kubectl exec $(get_pod_name_by_selector \
    postgres-operator.crunchydata.com/data pgbackrest) \
    -n postgres-operator \
    -- ls /pgbackrest/repo1/archive/db/15-2/"

if $cmd && [ -n "$cmd" ]; then
    exit 0
else
    echo "Backup directory doesn't exist or its empty"
    exit 1
fi
