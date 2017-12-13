#!/bin/bash

rsync_pid=`lsof -i:873 | awk '{print $2}' | sed -n '2p'`
echo $rsync_pid

kill $rsync_pid
kill -9 $rsync_pid
rm /var/run/rsyncd.pid -f
echo "关闭rsyncd"


