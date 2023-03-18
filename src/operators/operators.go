package operators

import (
	"io/fs"
	"strconv"

	"operators/filesystem"
	"operators/log"
	"operators/operators/tests"
)

type Result struct {
	install bool
	update  bool
	errors  []string
}

type Operators struct {
	Logger    *log.Logger
	Operators []fs.FileInfo
	Results   []*Result
}

func (o *Operators) GetOperators() *Operators {
	files, err := filesystem.GetDirectoryContents("./templates")

	if err != nil {
		o.Logger.Error("Unable to get Operateror templates due to:")
		panic(err.Error())
	}

	o.Operators = filesystem.FilterDirectories(files)
	return o
}

func (o *Operators) PrintOperatorsSum() *Operators {
	sum := len(o.Operators)

	if sum == 0 {
		panic("No Operator found")

	} else {
		o.Logger.Succes("Found " + strconv.Itoa(sum))
		if sum == 1 {
			o.Logger.Info(" Operator")
		} else {
			o.Logger.Info(" Operators")
		}
		o.Logger.NewLine()
	}

	return o
}

func (o *Operators) TestAll() *Operators {
	for i, operator := range o.Operators {
		result := &Result{}
		o.Results = append(o.Results, result)
		o.testInstall(i, operator.Name())
	}

	o.Logger.Succes("Testing Operators").NewLine()
	return o
}

func (o *Operators) PrintResults() *Operators {
	o.Logger.WithSpinner("Printing results").Succes("Good results").NewLine()
	o.Logger.WithSpinner("Printing results").Warn("Bad results").NewLine()
	return o
}

func (o *Operators) testInstall(i int, name string) {
	result, err := tests.Install(name, o.Logger)

	if err != nil {
		o.Results[i].errors = append(o.Results[i].errors, err.Error())
	}

	o.Results[i].install = result
}
