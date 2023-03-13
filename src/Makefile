kindCreate:
	kind create cluster --name kind --config ./kind/config.yaml

kindDelete:
	kind delete cluster --name kind

kindSetKubectl:
	kubectl cluster-info --context kind-kind

kind: kindCreate kindSetKubectl

# PGO
pgoInstall:
	kubectl apply -k ./pgo/postgres-operator-examples-main/kustomize/install/namespace
	kubectl apply --server-side -k ./pgo/postgres-operator-examples-main/kustomize/install/default

pgoInstallCheck:
	kubectl -n postgres-operator get pods --selector=postgres-operator.crunchydata.com/control-plane=postgres-operator 

pgoDescribe:
	kubectl -n postgres-operator describe pods --selector=postgres-operator.crunchydata.com/control-plane=postgres-operator 

pgoClusterCreate:
	kubectl apply -k ./pgo/create-ha-cluster-with-monitoring/create-ha-cluster

pgoClusterCheck:
	kubectl -n postgres-operator describe postgresclusters.postgres-operator.crunchydata.com hippo	

pgoMonitoringInstall:
	kubectl apply -k ./pgo/create-ha-cluster-with-monitoring/monitoring

pgoMonitoringDelete:
	kubectl delete -k ./pgo/create-ha-cluster-with-monitoring/monitoring

pgoMonitoringPortForwarding:
	kubectl port-forward service/crunchy-grafana 3000:3000 -n postgres-operator

pgoPostgresPortForwarding:
	kubectl port-forward service/hippo-replicas 5432:5432 -n postgres-operator
