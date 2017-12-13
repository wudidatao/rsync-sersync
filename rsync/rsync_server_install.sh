#!/bin/sh

. ./base.sh

#安装rsync服务端
yum install rsync -y

#配置配置文件
cat >> /etc/rsyncd.conf <<EOF
#全局参数
#运行rsync守护进程的用户，这个参数设置nobody没效果，不知道咋回事
uid = root
#运行rsyncC守护进程的组，这个参数设置nobody没效果，不知道咋回事
gid = root
#不使用chroot技术
use chroot = no
#客户端连接服务器的最大连接数
max connections = 5
#是否检查口令文件的权限
strict modes = yes
#服务启用的监听端口(默认873)
port = 873
#pid文件位置
pid file = /var/run/rsyncd.pid
#锁文件位置
lock file = /var/run/rsync.lock
#日志文件位置    
log file = /var/log/rsyncd/rsyncd.log

#模块参数
#认证模块名，客户端需要设置
[backup]
#需要做镜像的目录
path = /backup/
#这个模块的注释信息
comment = This is a test
#忽略一些无关的IO错误  
ignore errors
#设置为可读,表示客户端可以上传文件到服务端，yes为只读，表示客户端只能从服务端读取，不能上传。
#如果是集中备份服务器，该参数使用no，如果是反向代理，一般是yes。
read only = no
#设置为可写，表示客户端可以从服务端下载，yes为不可写，客户端不可从服务端下载文件。
write only = no
#no为不可列出文件列表，yes为可列出文件列表
list = no
#设置认证用户名，如果不设置则表明是匿名，此用户与系统无关，可以随便设置
auth users = $username
#设置认证用户的密码文件位置，需要手动设置密码文件
secrets file = /etc/rsync.passwd
#允许的主机范围,*表示所有主机都可以，如果主机不在该范围，则报模块错误
hosts allow = * 
#禁止的主机范围
hosts deny = 0.0.0.0/0
EOF

#初始化日志目录
mkdir -p /var/log/rsyncd

#初始化密码文件
echo "$username:$password" > /etc/rsync.passwd
chmod 600 /etc/rsync.passwd 

#启动服务
systemctl restart rsyncd

#配置开机启动
systemctl enable rsyncd
