package k8s

import (
	"k8s.io/client-go/kubernetes"
)

func GetClient() (*kubernetes.Clientset, error) {

	// use the current context in kubeconfig
	config, err := getConfig()
	if err != nil {
		return nil, err
	}

	// create the clientset
	clientset, err := kubernetes.NewForConfig(config)
	if err != nil {
		return nil, err
	}

	return clientset, nil
}
