#!/bin/bash

rsync_pid=`lsof -i:873 | awk '{print $2}' | sed -n '2p'`
echo $rsync_pid

kill $rsync_pid
echo "关闭rsyncd"
