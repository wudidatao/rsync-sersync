#!/bin/bash

. ./base.sh

echo "$rsync_auth_passwd" >/etc/rsync.pas
chmod 600 /etc/rsync.pas
echo "密码配置文件完成"