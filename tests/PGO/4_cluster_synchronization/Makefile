check:
	kubectl exec $$(kubectl -n postgres-operator get pods \
	--selector=postgres-operator.crunchydata.com/role=master \
	-o jsonpath='{.items[*].metadata.name}') \
	-n postgres-operator \
	-- psql -U postgres -c "create database test"

	kubectl exec $$(kubectl -n postgres-operator get pods \
	--selector=postgres-operator.crunchydata.com/role=replica \
	-o jsonpath='{.items[*].metadata.name}') \
	-n postgres-operator \
	-- psql -U postgres -c "SELECT 1 as success FROM pg_database WHERE datname = 'test'"

dropDb:
	kubectl exec $$(kubectl -n postgres-operator get pods \
	--selector=postgres-operator.crunchydata.com/role=master \
	-o jsonpath='{.items[*].metadata.name}') \
	-n postgres-operator \
	-- psql -U postgres -c "drop database test"
