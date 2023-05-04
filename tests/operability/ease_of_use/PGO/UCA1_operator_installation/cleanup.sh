#!/bin/bash
kubectl delete -k "$(dirname "$(realpath "$0")")/install/namespace"
kubectl delete -k "$(dirname "$(realpath "$0")")/install/default"
