# Open JDK

## 1. 简介

集成了Open JDK的Alpine操作系统

## 2. 特性

1. OpenJDK 8
2. TZ=Asia/Shanghai
3. C.UTF-8
4. curl和telnet
5. arthas(在/usr/local/arthas目录下)
6. SkyWalking Agent(在/usr/local/skywalking/agent目录下)

## 3. 编译并上传镜像

```sh
docker buildx build --platform linux/arm64,linux/amd64 -t nnzbz/openjdk:8 --build-arg VERSION=8 . --push
docker buildx build --platform linux/arm64,linux/amd64 -t nnzbz/openjdk:11 --build-arg VERSION=11 . --push
docker buildx build --platform linux/arm64,linux/amd64 -t nnzbz/openjdk:8-alpine --build-arg VERSION=8-alpine . --push
# latest
docker buildx build --platform linux/arm64,linux/amd64 -t nnzbz/openjdk:latest --build-arg VERSION=8-alpine . --push
```

## 4. 创建并运行容器

```sh
docker run --rm -it --name 容器名称 nnzbz/openjdk
```

## 5. 如果要运行jstatd监控

进入容器中，执行如下命令

如果要前台运行（注意Ctrl+C则会关闭程序，直接关闭命令行则不会）

```sh
jstatd -J-Djava.rmi.server.hostname=<ip> -J-Dcom.sun.management.jmxremote.authenticate=false -J-Dcom.sun.management.jmxremote.rmi.port=1099 -J-Dcom.sun.management.jmxremote.ssl=false -J-Djava.security.policy=/usr/local/jvm/jstatd.all.policy
```

如果要后台运行

```sh
nohup jstatd -J-Djava.rmi.server.hostname=<ip> -J-Dcom.sun.management.jmxremote.authenticate=false -J-Dcom.sun.management.jmxremote.rmi.port=1099 -J-Dcom.sun.management.jmxremote.ssl=false -J-Djava.security.policy=/usr/local/jvm/jstatd.all.policy >> /usr/local/output.log 2>&1 &
```

- -J-Djava.rmi.server.hostname一定要填写正确的docker容器的宿主IP地址
- jstatd默认端口号是1099，如果要自定义，用 ```-p``` 参数指定端口号
- 运行命令后，可在宿主服务器运行 ```ss -anp | grep 1099``` 查看是否启动成功
