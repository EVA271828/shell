#!/bin/bash
# author： 不可微
# version： v1
# date： 2023-11-09
#---------分割线----------
# /home/tiny中创建20个文件
# 检查/home/tiny目录下所有文件和目录，看是否满足下面条件：
# 1.所有文件权限为644
# 2.所有目录权限为755
# 3.文件和目录所有者为www,所属组为root,
# 4.如果不满足，改成符合要求
# 注意，不要直接改权限，一定要有判断的过程。
#---------分割线----------
# 检查文件是否存在并创建
for index in $(seq -w 0 1 10); do
    if [ ! -f /home/tiny/file_${index} ]; then
        touch /home/tiny/file_${index}
    else
        echo "file_${index}文件已存在"
    fi
done
# 获取文件列表
for file in $(find /home/tiny); do
    # 获取文件权限
    f_p=$(stat -c %a ${file})
    # 文件用户
    f_u=$(stat -c %U ${file})
    # 文件所属组
    f_g=$(stat -c %G ${file})
    #修改文件权限
    if [ -d ${file} ]; then
        [ f_p!=755 ] && $(chmod 755 ${file})

    else
        [ f_p!=644 ] && $(chmod 644 ${file})

    fi
    #修改文件所属用户
    [ f_u!='tiny' ] && $(chown tiny ${file})
    #修改文件所属组
    [ f_g!='root' ] && $(chown :root ${file})
done
