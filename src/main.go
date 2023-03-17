package main

import (
	"context"

	"operators/cluster"
	"operators/log"
	"operators/operators"
)

func main() {
	l := log.Logger{}
	ctx := context.Background()

	c := cluster.Cluster{
		Logger: &l,
		Ctx:    &ctx,
	}
	c.GetClient().GetPods().GetServices().GetSecrets().GetConfigMaps()

	// find operators
	o := operators.Operators{
		Logger: &l,
	}
	o.GetOperators().PrintOperatorsSum()

	// test operators
	o.TestAll()

	o.PrintResults()

}
