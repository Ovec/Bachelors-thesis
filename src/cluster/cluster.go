package cluster

import (
	"context"

	corev1 "k8s.io/api/core/v1"
	"k8s.io/client-go/kubernetes"

	"operators/cluster/k8s"
	"operators/log"
)

type Cluster struct {
	Logger     *log.Logger
	Ctx        *context.Context
	Client     *kubernetes.Clientset
	Pods       *corev1.PodList
	Services   *corev1.ServiceList
	Secrets    *corev1.SecretList
	ConfigMaps *corev1.ConfigMapList
}

func (c *Cluster) GetClient() *Cluster {
	client, err := k8s.GetClient()
	c.Logger.Info("Creating Kubernetes client")

	if err != nil {
		c.Logger.Error("Unable to create client due to following error:")
		panic(err.Error())
	}

	c.Logger.RemoveLine().Succes("Client created\n")
	c.Client = client
	return c
}

func (c *Cluster) GetPods() *Cluster {
	pods, err := k8s.GetPods(c.Client, c.Ctx)

	if err != nil {
		c.Logger.Error("Unable to get pods due to following error:").NewLine()
		panic(err.Error())
	}
	c.Pods = pods

	c.Logger.Succes("Pods received\n")
	return c
}

func (c *Cluster) GetServices() *Cluster {
	services, err := k8s.GetServices(c.Client, c.Ctx)

	if err != nil {
		c.Logger.Error("Unable to get services due to following error:").NewLine()
		panic(err.Error())
	}
	c.Services = services

	c.Logger.Succes("Services received\n")
	return c
}

func (c *Cluster) GetSecrets() *Cluster {
	secrets, err := k8s.GetSecrets(c.Client, c.Ctx)

	if err != nil {
		c.Logger.Error("Unable to get secrets due to following error:").NewLine()
		panic(err.Error())
	}
	c.Secrets = secrets

	c.Logger.Succes("Secrets received\n")
	return c
}

func (c *Cluster) GetConfigMaps() *Cluster {
	cm, err := k8s.GetConfigMaps(c.Client, c.Ctx)

	if err != nil {
		c.Logger.Error("Unable to get config maps due to following error:").NewLine()
		panic(err.Error())
	}
	c.ConfigMaps = cm

	c.Logger.Succes("Config maps received\n")
	return c
}

func (c *Cluster) PrintServices() *Cluster {

	c.Logger.Warn("\n----------------- Deployed Services -----------------\n\n")
	for _, service := range c.Services.Items {
		c.Logger.Info(service.Name + "\n")
	}
	c.Logger.NewLine().NewLine()

	return c
}

func (c *Cluster) PrintPods() *Cluster {

	c.Logger.Warn("\n------------------- Deployed Pods -------------------\n\n")
	for _, pod := range c.Pods.Items {
		c.Logger.Info(pod.Name + "\n")
	}
	c.Logger.NewLine().NewLine()

	return c
}

func (c *Cluster) PrintSecrets() *Cluster {

	c.Logger.Warn("\n------------------- Created Secrets -------------------\n\n")
	for _, pod := range c.Secrets.Items {
		c.Logger.Info(pod.Name + "\n")
	}
	c.Logger.NewLine().NewLine()

	return c
}

func (c *Cluster) PrintConfigMaps() *Cluster {

	c.Logger.Warn("\n------------------ Created Config maps ----------------\n\n")
	for _, cm := range c.ConfigMaps.Items {
		c.Logger.Info(cm.Name + "\n")
	}
	c.Logger.NewLine().NewLine()

	return c
}
