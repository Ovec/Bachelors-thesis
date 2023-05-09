#!/bin/bash
kubectl port-forward service/crunchy-grafana 3000:3000 -n postgres-operator
