#!/bin/bash

. ./base.sh

cd $install_path

read -p "是否安装rsync，yes安装，no不安装，默认不安装：" set_install 
if [ $set_install == 'yes' ];then
    yum install -y rsync
fi

read -p "是否下载sersync，yes下载，no不下载，默认不下载：" set_install
if [ $set_install == 'yes' ];then
    if [ ! -e sersync2.5.4_64bit_binary_stable_final.tar.gz ];then
        wget https://raw.githubusercontent.com/orangle/sersync/master/release/sersync2.5.4_64bit_binary_stable_final.tar.gz
    fi
fi

tar -zxvf sersync2.5.4_64bit_binary_stable_final.tar.gz
rm /usr/local/sersync -rf
mv GNU-Linux-x86 /usr/local/sersync
cd /usr/local/sersync

sed -i "s#/opt/tongbu#$sersync_localpath_watch#g" confxml.xml
sed -i "s/127.0.0.1/$sersync_remote_ip/g" confxml.xml
sed -i "s/tongbu1/$rsync_mode_name/g" confxml.xml
sed -i '/<auth/s/false/true/g'  confxml.xml
sed -i "s/root/$rsync_auth_users/g" confxml.xml
echo "启动配置文件修改完成"

chown $rsync_uid:$rsync_gid $sersync_localpath_watch
echo "修改同步目录权限"
