package k8s

import (
	"context"

	corev1 "k8s.io/api/core/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/client-go/kubernetes"
)

func GetPods(client *kubernetes.Clientset, ctx *context.Context) (*corev1.PodList, error) {
	pods, err := client.CoreV1().Pods("").List(*ctx, metav1.ListOptions{})
	if err != nil {
		return nil, err
	}

	return pods, nil
}
