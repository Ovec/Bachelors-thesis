#!/bin/bash
kubectl apply -k "$(dirname "$(realpath "$0")")/patch"
kubectl apply -k "$(dirname "$(realpath "$0")")/monitoring"
