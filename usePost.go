package main

import (
	"fmt"

	"github.com/ms77grz/posttestgo"
)

func main() {
	posttestgo.Hostname = "localhost"
	fmt.Println(posttestgo.Port)
	fmt.Println(posttestgo.Hostname)
}
