#!/bin/bash
mkdir step1 step2

cat << EOF > main.go
package main

import "fmt"

func main() {
  fmt.Println("hello, world")
}
EOF