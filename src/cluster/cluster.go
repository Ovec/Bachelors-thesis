package cluster

import (
	"context"

	corev1 "k8s.io/api/core/v1"
	"k8s.io/client-go/kubernetes"

	"operators/cluster/k8s"
	"operators/log"
)

type Cluster struct {
	Ctx        context.Context
	Client     *kubernetes.Clientset
	Pods       *corev1.PodList
	Services   *corev1.ServiceList
	Secrets    *corev1.SecretList
	ConfigMaps *corev1.ConfigMapList
}

func (c *Cluster) GetClient() *Cluster {
	client, err := k8s.GetClient()
	log.Info("Creating Kubernetes client")

	if err != nil {
		log.Error("Unable to create client due to following error:")
		panic(err.Error())
	}

	log.RemoveLine()
	log.Succes("Client created\n")
	c.Client = client
	return c
}

func (c *Cluster) GetPods() *Cluster {
	pods, err := k8s.GetPods(c.Client, &c.Ctx)

	if err != nil {
		log.Error("Unable to get pods due to following error")
		panic(err.Error())
	}
	c.Pods = pods

	log.Succes("Pods received\n")
	return c
}

func (c *Cluster) GetServices() *Cluster {
	services, err := k8s.GetServices(c.Client, &c.Ctx)

	if err != nil {
		log.Error("Unable to get services due to following error")
		panic(err.Error())
	}
	c.Services = services

	log.Succes("Services received\n")
	return c
}

func (c *Cluster) GetSecrets() *Cluster {
	secrets, err := k8s.GetSecrets(c.Client, &c.Ctx)

	if err != nil {
		log.Error("Unable to get secrets due to following error")
		panic(err.Error())
	}
	c.Secrets = secrets

	log.Succes("Secrets received\n")
	return c
}

func (c *Cluster) GetConfigMaps() *Cluster {
	cm, err := k8s.GetConfigMaps(c.Client, &c.Ctx)

	if err != nil {
		log.Error("Unable to get config maps due to following error")
		panic(err.Error())
	}
	c.ConfigMaps = cm

	log.Succes("Config maps received\n")
	return c
}

func (c *Cluster) PrintServices() *Cluster {

	log.Warn("\n----------------- Deployed Services -----------------\n\n")
	for _, service := range c.Services.Items {
		log.Info(service.Name + "\n")
	}
	log.Warn("\n\n")

	return c
}

func (c *Cluster) PrintPods() *Cluster {

	log.Warn("\n------------------- Deployed Pods -------------------\n\n")
	for _, pod := range c.Pods.Items {
		log.Info(pod.Name + "\n")
	}
	log.Warn("\n\n")

	return c
}

func (c *Cluster) PrintSecrets() *Cluster {

	log.Warn("\n------------------- Created Secrets -------------------\n\n")
	for _, pod := range c.Secrets.Items {
		log.Info(pod.Name + "\n")
	}
	log.Warn("\n\n")

	return c
}

func (c *Cluster) PrintConfigMaps() *Cluster {

	log.Warn("\n------------------ Created Config maps ----------------\n\n")
	for _, cm := range c.ConfigMaps.Items {
		log.Info(cm.Name + "\n")
	}
	log.Warn("\n\n")

	return c
}
