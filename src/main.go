package main

import (
	"context"

	"operators/cluster"
	"operators/operators"
)

func main() {
	c := cluster.Cluster{
		Ctx: context.Background(),
	}
	c.GetClient().GetPods().GetServices().GetSecrets().GetConfigMaps()

	// find operators
	o := operators.Operators{}
	o.GetOperators().PrintOperatorsSum()

}
