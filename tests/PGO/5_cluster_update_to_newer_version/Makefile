checkPGversion:
	kubectl exec $$(kubectl -n postgres-operator get pods \
	--selector=postgres-operator.crunchydata.com/role=master \
	-o jsonpath='{.items[*].metadata.name}') \
	-n postgres-operator \
	-- psql -U postgres -c "SELECT version()"

checkDBexistence:
	kubectl exec $$(kubectl -n postgres-operator get pods \
	--selector=postgres-operator.crunchydata.com/role=replica \
	-o jsonpath='{.items[*].metadata.name}') \
	-n postgres-operator \
	-- psql -U postgres -c "SELECT 1 as success FROM pg_database WHERE datname = 'test'"


installPGupgrade:
	kubectl apply -k ./pg-upgrade

describePGupgrade:
	kubectl describe pgupgrade hippo-upgrade -n postgres-operator

annotateUpgrade:
	kubectl -n postgres-operator annotate postgrescluster hippo-ha postgres-operator.crunchydata.com/allow-upgrade="hippo-upgrade"


uc:
	kubectl get pgupgrade hippo-upgrade -n postgres-operator -o jsonpath='{.status.conditions[-1:].type}'

clusterShutdown:
	kubectl apply -k ./high-availability-shutdown

clusterStart:
	kubectl apply -k ./high-availability-start
