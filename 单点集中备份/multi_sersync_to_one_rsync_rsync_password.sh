﻿#!/bin/bash

. ./base.sh

echo "$rsync_auth_users:$rsync_auth_passwd" >/etc/rsync.pas
chmod 600 /etc/rsync.pas
echo "密码文件配置完成"