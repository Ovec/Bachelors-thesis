#!/bin/bash
kubectl delete -k "$(dirname "$(realpath "$0")")/postgres"
kubectl delete ns postgres-operator
