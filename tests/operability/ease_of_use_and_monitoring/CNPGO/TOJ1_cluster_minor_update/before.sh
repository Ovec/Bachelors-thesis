#!/bin/bash
kubectl create ns postgres-operator
kubectl apply -k ./patch_14_6
