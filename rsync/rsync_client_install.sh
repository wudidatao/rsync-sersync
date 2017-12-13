#!/bin/bash

#安装rsync客户端
yum install rsync -y

#配置客户端的过滤文件规则
if [ -f /etc/rsync_exclude.lst ]; then
   cp /etc/rsync_exclude.lst /etc/rsync_exclude.lst_$(date +%Y%m%d)
else
   echo "*.log" >> /etc/rsync_exclude.lst
   echo "test" >> /etc/rsync_exclude.lst
fi
