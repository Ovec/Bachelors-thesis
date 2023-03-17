package filesystem

import (
	"io/fs"
	"os"

	"operators/log"
)

func GetDirectoryContents(dir string) []fs.FileInfo {

	d, err := os.Open(dir)
	if err != nil {
		log.Error("Unable to open folder " + dir + "\n")
		panic(err.Error())
	}

	defer d.Close()

	// Read the directory contents
	files, err := d.Readdir(-1)
	if err != nil {
		log.Error("Unable to read folder " + dir + "\n")
		panic(err.Error())
	}

	return files
}

func FilterDirectories(files []fs.FileInfo) []fs.FileInfo {
	var directories = make([]fs.FileInfo, 0)

	for _, file := range files {
		if file.IsDir() {
			directories = append(directories, file)
		}
	}

	return directories

}
