package operators

import (
	"io/fs"
	"strconv"

	"operators/filesystem"
	"operators/log"
)

type Operators struct {
	Operators []fs.FileInfo
}

func (o *Operators) GetOperators() *Operators {
	files := filesystem.GetDirectoryContents("./templates")

	o.Operators = filesystem.FilterDirectories(files)
	return o
}

func (o *Operators) PrintOperatorsSum() *Operators {
	sum := len(o.Operators)

	if sum == 0 {
		panic("No Operator found")

	} else {
		log.Succes("Found " + strconv.Itoa(sum))
		if sum == 1 {
			log.Succes(" Operator")
		} else {
			log.Succes(" Operators")
		}

		log.Succes("\n")

	}

	return o
}
