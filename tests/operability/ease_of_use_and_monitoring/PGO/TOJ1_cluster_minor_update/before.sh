#!/bin/bash
kubectl apply -k "$(dirname "$(realpath "$0")")/patch_14_6"
