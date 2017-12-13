#!/bin/bash

install_path=/root/install

#rsync的uid和gid分别表示同步时使用的linux用户，而并非启动守护进程时的用户
rsync_uid=nobody
rsync_gid=nobody
rsync_max_connections=3
rsync_mode_name=191log
rsync_path=/data/logs/191/
rsync_read_only=no
rsync_write_only=no
rsync_list=no
rsync_auth_users=liutao
rsync_auth_passwd=123456
rsync_hosts_allow=192.168.100.191

sersync_localpath_watch=/data/logs
sersync_remote_ip=192.168.100.190

echo "install_path" $install_path

echo "rsync_uid" $rsync_uid
echo "rsync_gid" $rsync_gid
echo "rsync_max_connections" $rsync_max_connections
echo "sync_mode_name" $rsync_mode_name
echo "rsync_path" $rsync_path
echo "rsync_read_only" $rsync_read_only
echo "rsync_write_only" $rsync_write_only
echo "rsync_list" $rsync_list
echo "rsync_auth_users" $rsync_auth_users
echo "rsync_auth_passwd" $rsync_auth_passwd
echo "rsync_hosts_allow" $rsync_hosts_allow

echo "sersync_localpath_watch" $sersync_localpath_watch
echo "sersync_remote_ip" $sersync_remote_ip