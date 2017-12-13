#!/bin/bash

. ./base.sh

read -p "是否安装rsync，yes安装，no不安装，默认不安装：" set_install 
if [ $set_install == 'yes' ];then
    yum install -y rsync
fi
echo "rsync服务安装完成"

cp /etc/rsyncd.conf /etc/rsyncd.conf_`date "+%Y%m%d"`
echo "rsync服务启动文件备份完成"

echo "uid = $rsync_uid
gid = $rsync_gid
use chroot = no
max connections = $rsync_max_connections
strict modes = yes
port = 873
pid file = /var/run/rsyncd.pid
lock file = /var/run/rsync.lock
log file = /var/log/rsyncd/rsyncd.log

[$rsync_mode_name]
comment = $rsync_mode_name
path = $rsync_path
read only = $rsync_read_only
write only = $rsync_write_only
list = $rsync_list
auth users = $rsync_auth_users
secrets file = /etc/rsync.pas
hosts allow = $rsync_hosts_allow
" > /etc/rsyncd.conf
echo "rsync服务启动文件配置完成"