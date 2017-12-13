#!/bin/bash
. ./bash

#服务端执行，服务端主动将模块中的内容推送到客户端上

#默认非一致性推送，客户端在服务端不存在的文件会被保留，客户端在服务端名字相同的文件不覆盖，不推送软链接
#rsync -goprtvzDP --exclude-from=/etc/rsync_exclude.lst -e "$ssh_port" $server_path root@$clientip:$clinet_path

#强一致性推送，客户端在服务端在不存在的文件会被删除（--delete），服务端在客户端名字相同的文件被覆盖，推送软链接（-l）
#rsync -gloprtvzDP --delete --exclude-from=/etc/rsync_exclude.lst -e "$ssh_port" $server_path root@$clientip:$clinet_path

#非一致性推送，客户端在服务端不存在的文件会被保留，客户端在服务端名字相同的文件不被覆盖（-u），推送软链接
rsync -gloprtuvzDP --exclude-from=/etc/rsync_exclude.lst -e "$ssh_port" $server_path root@$client_ip:$clinet_path
