#!/bin/bash
suffix=`date +%Y%m%d_%H%M%S`
for file in $(find /etc -type f -name '*.conf'); do
    #提取文件名 
    fineName=$(basename ${file})
    # -p: 递归创建多级目录
    mkdir -p ./backups
    # 当复制的是文件夹时,可以使用 -r 选项,即使目标文件夹不存在也会被创建
    cp  $file  ./backups/${fineName}_${suffix}
    echo ${fineName}_${suffix} "被备份了"
done
