#!/bin/sh
# 去除开头结尾的空白字符
trim() {
    str=""

    if [ $# -gt 0 ]; then
        str="$1"
    fi
    echo "$str" | sed -e 's/^[ \t\r\n]*//g' | sed -e 's/[ \t\r\n]*$//g'
}

# 获取系统标识符：ubuntu、centos、alpine等
getOs() {
    os=$(trim $(cat /etc/os-release 2>/dev/null | grep ^ID= | awk -F= '{print $2}'))

    if [ "$os" = "" ]; then
        os=$(trim $(lsb_release -i 2>/dev/null | awk -F: '{print $2}'))
    fi
    if [ ! "$os" = "" ]; then
        os=$(echo $os | tr '[A-Z]' '[a-z]')
    fi

    echo $os
}

# 具体业务逻辑
os=$(getOs)
case $os in
debian)
    TZ=Asia/Shanghai
    DEBIAN_FRONTEND=noninteractive
    ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime
    echo ${TZ} > /etc/timezone
    dpkg-reconfigure --frontend noninteractive tzdata
    rm -rf /var/lib/apt/lists/*
    ;;
ubuntu)
    # 设置时区
    ln -sf /usr/share/zoneinfo/Asia/ShangHai /etc/localtime
    echo "Asia/Shanghai" > /etc/timezone
    dpkg-reconfigure -f noninteractive tzdata
    ;;
centos)
    # 设置编码格式
    LC_ALL en_US.UTF-8
    # 设置时区
    TZ=Asia/Shanghai
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime
    echo $TZ > /etc/timezone
    ;;
alpine)
    # 设置时区
    apk add tzdata
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
    echo "Asia/Shanghai" > /etc/timezone
    apk del tzdata
    # 安装curl
    apk add curl
    ;;
*)
    echo unknow os $os, exit!
    # return
    ;;
esac
