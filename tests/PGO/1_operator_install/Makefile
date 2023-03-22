install:
	kubectl apply --server-side -k ./namespace
	kubectl apply --server-side -k ./default

check:
	kubectl -n postgres-operator get pods