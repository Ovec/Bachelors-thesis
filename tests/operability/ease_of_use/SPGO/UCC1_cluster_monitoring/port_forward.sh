GRAFANA_POD=$(kubectl get pods --namespace monitoring -l "app.kubernetes.io/name=grafana" -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward "$GRAFANA_POD" --address 0.0.0.0 3000:3000 --namespace monitoring
