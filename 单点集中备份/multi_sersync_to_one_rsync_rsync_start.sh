#!/bin/bash

/usr/bin/rsync --daemon --config=/etc/rsyncd.conf
echo "开启rsyncd"
