package tests

import (
	"errors"

	"operators/filesystem"
	"operators/log"
)

func Install(name string, logger *log.Logger) (bool, error) {
	logger.Error(name)

	// deploy
	// check if install folder exist and there are files in it
	folderContents, err := filesystem.GetDirectoryContents("./templates/" + name + "/install")

	// install folder dos not exist
	if err != nil {
		return false, errors.New("Install folder does not exist")
	}

	folders := filesystem.FilterDirectories(folderContents)

	if len(folders) == 0 {
		return false, errors.New("Install folder doesn't have any files of folders")
	}

	for _, v := range folders {
		print(v.Name())
		print(v.IsDir())
		println()
	}

	// check if its deployd
	// return result
	// should have deploy time constant
	// make steps generic 1_asdasda, 2_asdad
	// steps without number will be ignored
	// make this step more reneric
	// it should be named deploy and it should deploy all files no matter what
	// so this part should be - gather all steps
	// maybe I shlould somehow realize if its delete step or create step

	return true, nil

}
