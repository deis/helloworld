package main

import (
    "fmt"
    "log"
    "net/http"
    "os"
)

func main() {
    http.HandleFunc("/", hello)
    err := http.ListenAndServe(":"+os.Getenv("PORT"), nil)
    if err != nil {
        log.Fatal("ListenAndServe:", err)
    }
}

func hello(w http.ResponseWriter, req *http.Request) {
    fmt.Fprintln(w, "Welcome to Deis!")
    fmt.Fprintln(w, "See the documentation at http://docs.deis.io/ for more information.")
}
