package main

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

func main() {
	router := gin.Default()
	router.GET("/ping", func(context *gin.Context) {
		context.String(http.StatusOK, "PONG")
	})
	router.Run(":8080")
}