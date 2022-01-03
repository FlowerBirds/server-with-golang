package main

import (
	"fmt"
	"github.com/gorilla/mux"
	"github.com/prometheus/client_golang/prometheus/promhttp"
	"log"
	"net/http"
)

func main() {

	router := mux.NewRouter()
	router.Path("/").Handler(http.FileServer(http.Dir("./static/")))
	router.Path("/router").Handler(promhttp.Handler())

	fmt.Println("Serving requests on port 9000")
	err := http.ListenAndServe(":9000", router)
	log.Fatalln(err)
}
