#!/bin/bash
# author 不可微
# version 0
# date 2023-11-08
# 创建一个shell脚本，创建十个用户，并将账号密码存到txt文件里面
# 判断文件是否存在，并进行覆盖
if [ -f /tmp/userinfo.txt ]; then
    rm -f /tmp/userinfo.txt && touch /tmp/userinfo.txt
fi
# 判断mkpasswd命令是否存在，不存在则安装
if ! which 'mkpasswd'; then
    apt install whois
fi
# 生成一个序列循环十次
for index in $(seq 20 1 30); do
    password=`mkpasswd  1`
    useradd  user${index} -p ${password}
    echo "user:user${index}  password:${password}"
    # 创建用户并将账号密码存到txt文件中
    echo "user:user${index}  password:${password}"  >> /tmp/userinfo.txt
done

