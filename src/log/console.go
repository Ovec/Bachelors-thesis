package log

import (
	"fmt"
	"time"

	"github.com/briandowns/spinner"
)

const (
	green  = "\033[32m"
	yellow = "\033[33m"
	red    = "\033[31m"
	reset  = "\033[0m"
)

type Logger struct {
	spinner *spinner.Spinner
}

func (l *Logger) Info(message string) *Logger {
	fmt.Printf("%s", message)
	return l
}

func (l *Logger) Succes(message string) *Logger {
	fmt.Printf("%s%s %s%s", green, "✓", reset, message)
	return l
}

func (l *Logger) Error(message string) *Logger {
	fmt.Printf("%s%s %s%s", red, "×", reset, message)
	return l
}

func (l *Logger) Warn(message string) *Logger {
	fmt.Printf("%s%s %s%s", yellow, "!", reset, message)
	return l
}
func (l *Logger) NewLine() *Logger {
	fmt.Printf("\n")
	return l
}

func (l *Logger) RemoveLine() *Logger {
	fmt.Print("\n\033[1A\033[K")
	return l
}

func (l *Logger) WithSpinnerStart(message string) {
	if l.spinner == nil {
		l.spinner = spinner.New(spinner.CharSets[21], 100*time.Millisecond)
	}

	l.spinner.Color("yellow")
	l.spinner.Suffix = " " + message
	l.spinner.Start()
}

func (l *Logger) WithSpinnerStop() *Logger {
	l.spinner.Stop()
	return l
}
