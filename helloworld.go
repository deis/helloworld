package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func main() {
	http.HandleFunc("/", hello)
	port := os.Getenv("PORT")
	if port == "" {
		port = "80"
	}
	err := http.ListenAndServe(":"+port, nil)
	if err != nil {
		log.Fatal("ListenAndServe:", err)
	}
}

func hello(w http.ResponseWriter, req *http.Request) {
	log.Printf("%s %s\n", req.Proto, req.URL)
	fmt.Fprintln(w, "Welcome to Deis!")
	fmt.Fprintln(w, "See the documentation at http://docs.deis.io/ for more information.")
}
