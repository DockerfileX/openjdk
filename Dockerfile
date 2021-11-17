ARG VERSION

# 基础镜像
FROM openjdk:${VERSION}

# 作者及邮箱
# 镜像的作者和邮箱
LABEL maintainer="nnzbz@163.com"
# 镜像的版本
LABEL version="1.0.0"
# 镜像的描述
LABEL description="集成了Open JDK的Alpine操作系统"

COPY ./run.sh /bin/
RUN chmod +x /bin/run.sh && /bin/run.sh


