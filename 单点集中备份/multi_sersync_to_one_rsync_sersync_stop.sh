#!/bin/bash

sersync_pid=`ps -ef | grep sersync2 | awk '{print $2}' |sed -n '1p'`
echo $sersync_pid

kill $sersync_pid
echo "关闭sersync服务"
