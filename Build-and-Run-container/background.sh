#!/bin/bash

cat << EOF > main.go
ackage main

import "fmt"

func main() {
  fmt.Println("hello, world")
}
EOF
