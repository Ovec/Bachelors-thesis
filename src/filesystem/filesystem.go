package filesystem

import (
	"io/fs"
	"os"
)

func GetDirectoryContents(dir string) ([]fs.FileInfo, error) {

	d, err := os.Open(dir)
	if err != nil {
		return nil, err
	}

	defer d.Close()

	// Read the directory contents
	files, err := d.Readdir(-1)
	if err != nil {
		return nil, err
	}

	return files, nil
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
