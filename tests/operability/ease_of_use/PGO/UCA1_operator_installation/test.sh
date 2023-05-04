#!/bin/bash
kubectl apply -k install/namespace
kubectl apply --server-side -k install/default
