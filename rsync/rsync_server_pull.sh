#!/bin/bash
. ./bash

#服务端执行，服务端主动从客户端上拉取内容到模块中
rsync -goprtvzDP --exclude-from=/etc/rsync_exclude.lst -e "$ssh_port" root@$client_ip:$clinet_path $server_path
