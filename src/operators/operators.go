package operators

import (
	"io/fs"
	"strconv"

	"operators/filesystem"
	"operators/log"
)

type Operators struct {
	Logger    *log.Logger
	Operators []fs.FileInfo
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

	o.Logger.Succes("Testing Operators").NewLine()
	return o
}

func (o *Operators) PrintResults() *Operators {

	o.Logger.Succes("Printing results").NewLine()
	return o
}
