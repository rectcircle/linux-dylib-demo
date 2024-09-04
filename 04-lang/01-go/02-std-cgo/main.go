package main

import (
	"fmt"
	"net"
	"os/user"
)

func main() {
	u, err := user.Lookup("root")
	if err != nil {
		panic(err)
	}
	fmt.Printf("root uid: %s\n", u.Uid)
	addrs, err := net.LookupHost("localhost")
	if err != nil {
		panic(err)
	}
	fmt.Printf("localhost addrs: %v\n", addrs)
}
