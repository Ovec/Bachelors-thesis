package k8s

import (
	"context"

	corev1 "k8s.io/api/core/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/client-go/kubernetes"
)

func GetServices(client *kubernetes.Clientset, ctx *context.Context) (*corev1.ServiceList, error) {
	services, err := client.CoreV1().Services("").List(*ctx, metav1.ListOptions{})
	if err != nil {
		return nil, err
	}

	return services, nil
}
