#! /bin/bash

# installation path of iptv streaming program, can be modified
installPath='/usr/local/IPTVStreaming'

# replace the absolute path with installation path
sed -n "s/\/usr\/local\/IPTVStreaming/$installPath/g" iptvstreaming
sed -n "s/\/usr\/local\/IPTVStreaming/$installPath/g" cfg/iptvstreaming.cfg
sed -n "s/\/usr\/local\/IPTVStreaming/$installPath/g" lib/functions

# for xmllint command
yum -y install libxml2

echo $0
