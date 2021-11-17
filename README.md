# Open JDK

## 1. 简介

集成了Open JDK的Alpine操作系统

## 2. 特性

1. Alpine操作系统
2. OpenJDK 8
3. TZ=Asia/Shanghai

## 3. 编译

```sh
docker build -t nnzbz/openjdk:8 --build-arg VERSION=8 .
docker build -t nnzbz/openjdk:11 --build-arg VERSION=11 .
docker build -t nnzbz/openjdk:8-alpine --build-arg VERSION=8-alpine .
# latest
docker tag nnzbz/openjdk:8-alpine nnzbz/openjdk:latest
```

## 3. 上传镜像

```sh
docker push nnzbz/openjdk:8
docker push nnzbz/openjdk:11
docker push nnzbz/openjdk:8-alpine
docker push nnzbz/openjdk:latest
```

## 4. 创建并运行容器

```sh
docker run --rm -it --name 容器名称 nnzbz/openjdk
```
