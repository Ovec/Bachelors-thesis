package log

import "fmt"

const (
	green  = "\033[32m"
	yellow = "\033[33m"
	red    = "\033[31m"
	reset  = "\033[0m"
)

func Info(message string) {
	fmt.Printf("%s", message)
}

func Succes(message string) {
	fmt.Printf("%s%s%s", green, message, reset)
}

func Error(message string) {
	fmt.Printf("%s%s%s", red, message, reset)
}

func Warn(message string) {
	fmt.Printf("%s%s%s", yellow, message, reset)
}

func RemoveLine() {
	fmt.Print("\n\033[1A\033[K")
}
