package main

import (
	"fmt"
	"net/http"
	"os"
	"time"
)

var lastRequestDetails string

func handleRequest(w http.ResponseWriter, r *http.Request) {
	requestDetails := fmt.Sprintf("Path: %s\nHeaders:\n", r.URL.Path)
	for name, values := range r.Header {
		for _, value := range values {
			requestDetails += fmt.Sprintf("%s: %s\n", name, value)
		}
	}
	lastRequestDetails = requestDetails

	fmt.Fprintf(w, "Hello World\n\n%s", requestDetails)
	fmt.Fprintf(os.Stderr, "Request received:\n%s", requestDetails)
}

func main() {
	lastRequestDetails = "No requests received yet."

	http.HandleFunc("/", handleRequest)

	go func() {
		for {
			echoNamespace := os.Getenv("ECHO_NAMESPACE")
			fmt.Printf("ECHO_NAMESPACE AND HTTP: %s\n", echoNamespace)
			fmt.Printf("Last request details:\n%s\n", lastRequestDetails)
			time.Sleep(25 * time.Second)
		}
	}()

	http.ListenAndServe(":8080", nil)
}
