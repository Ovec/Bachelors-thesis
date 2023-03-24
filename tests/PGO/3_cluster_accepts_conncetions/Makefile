installBusyBox:
	kubectl apply -f ./busybox.yaml

check: 
	kubectl get service hippo-ha-pgbouncer -n postgres-operator -o jsonpath='{.spec.clusterIP}'
	kubectl exec busybox telnet IPHERE 5432