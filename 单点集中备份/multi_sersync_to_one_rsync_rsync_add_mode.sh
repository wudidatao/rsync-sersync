#!/bin/bash

. ./base.sh

echo "
[$rsync_mode_name]
comment = $rsync_mode_name
path = $rsync_path
read only = $rsync_read_only
write only = $rsync_write_only
list = $rsync_list
auth users = $rsync_auth_users
secrets file = /etc/rsync.pas
hosts allow = $rsync_hosts_allow" >> /etc/rsyncd.conf
echo "服务启动文件模块增加完成"