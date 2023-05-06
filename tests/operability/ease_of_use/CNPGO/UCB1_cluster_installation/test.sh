#!/bin/bash
kubectl create ns postgres-operator
kubectl apply -k ./postgres
