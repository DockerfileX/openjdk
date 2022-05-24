ARG VERSION

# 基础镜像
FROM --platform=${TARGETPLATFORM} openjdk:${VERSION}

# 如果这里不重复定义参数，后面会取不到参数的值
ARG VERSION

# 作者及邮箱
# 镜像的作者和邮箱
LABEL maintainer="nnzbz@163.com"
# 镜像的版本
LABEL version=${VERSION}
# 镜像的描述
LABEL description="集成了Open JDK的操作系统"

# copy arthas(从另一个镜像中复制，小技巧)
COPY --from=hengyunabc/arthas:latest /opt/arthas /usr/local/arthas

COPY ./run.sh /bin/
RUN chmod +x /bin/run.sh && /bin/run.sh
