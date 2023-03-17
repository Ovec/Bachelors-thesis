package k8s

import (
	"context"

	corev1 "k8s.io/api/core/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/client-go/kubernetes"
)

func GetConfigMaps(client *kubernetes.Clientset, ctx *context.Context) (*corev1.ConfigMapList, error) {
	configMaps, err := client.CoreV1().ConfigMaps("").List(*ctx, metav1.ListOptions{})
	if err != nil {
		return nil, err
	}

	return configMaps, nil
}
