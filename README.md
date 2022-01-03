# server-with-golang
使用golang编写的一个服务器小程序


# 步骤
## 初始化模块
```shell
export GO111MODULE=on
```
在Goland开发工具中设置，File -> Settings... -> Go -> Go modules -> Enable go modules
```shell
go mod init github.com/FlowerBirds/server-with-golang 
```
在当前文件夹下生成go.mod文件，如下：
```
module github.com/FlowerBirds/server-with-golang

go 1.17
```

## 下载依赖模块
```shell
go get github.com/gorilla/mux
go get github.com/prometheus/client_golang/prometheus
go get github.com/prometheus/client_golang/prometheus/promauto
go get github.com/prometheus/client_golang/prometheus/promhttp
```

### 创建main.go文件并引入包
```go
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

```

### 复制依赖到vendor目录
```shell
go mod verdor
```
所有import的包将会被复制到当前vendor目录下，新import的包需要再次执行此命令


