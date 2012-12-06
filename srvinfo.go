// GoDemo project main.go
package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	fmt.Println("Checking the web site http header information...")
	resp, err := http.Get("http://www.csdn.net/")
	if err != nil {
		log.Fatal(err)
	}
	defer resp.Body.Close()
	fmt.Println("Status: ", resp.Status)
	head := resp.Header
	for k, v := range head {
		fmt.Println(k, ": ", v)
	}
}
