package main

import (
	"fmt"
	"net/http"
	"os"
	"time"

	"github.com/joho/godotenv"
)

type Config struct {
	SleepTime int
}

func DoHealthCheck(config Config) bool {
	url := "https://google.com"
	for {
		resp, err := http.Get(url)
		if err != nil || resp.StatusCode != 200 {
			fmt.Println("Healthcheck failed:", err)
		} else {
			fmt.Println("Server is healthy!")
		}
		time.Sleep(5 * time.Second)
	}
}

func main() {
	err := godotenv.Load()
	if err != nil {
		fmt.Println("Error reading env file", err)
		return
	}

	url := "https://google.com"

	DoHealthCheck(Config{SleepTime: 5})
	var gotServerResponse bool
}
