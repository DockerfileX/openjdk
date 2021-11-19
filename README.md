# Open JDK

## 1. 简介

集成了Open JDK的Alpine操作系统

## 2. 特性

1. Alpine操作系统
2. OpenJDK 8
3. TZ=Asia/Shanghai

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
