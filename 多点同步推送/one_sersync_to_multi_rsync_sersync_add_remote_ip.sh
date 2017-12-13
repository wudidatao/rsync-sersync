#!/bin/bash

. ./base.sh

cd /usr/local/sersync

line=`sed -n '/<remote/=' confxml.xml | tail -n 1`

sed -i "${line}a  <remote ip=\"${sersync_remote_ip}\" name=\"${sersync_remote_name}\"/>" confxml.xml 
