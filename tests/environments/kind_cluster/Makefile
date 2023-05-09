kindCreate:
	kind create cluster --name kind --config config.yaml

kindDelete:
	kind delete cluster --name kind

kindSetKubectl:
	kubectl cluster-info --context kind-kind

kind: kindCreate kindSetKubectl