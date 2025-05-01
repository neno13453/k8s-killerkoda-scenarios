#!/bin/bash
mkdir step1 step2

cat << EOF > ~/step1/main.go
package main

import "fmt"

func main() {
  fmt.Println("hello, world")
}
EOF

cat << EOF > ~/step2/main.go
package main

import "fmt"

func main() {
  fmt.Println("hello, world")
}
EOF