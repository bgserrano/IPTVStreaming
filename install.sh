#! /bin/bash

echo 'Start to install IPTV streaming'

# installation path of iptv streaming program, can be modified
installPath=/usr/local/IPTVStreaming

if [ ! -d $installPath ]; then
    mkdir -p $installPath
fi

echo "copy iptvstreaming service to $installPath"
cp iptvstreaming $installPath

echo "copy iptv streaming to $installPath"
cp -r daemon/ lib/ cfg/ $installPath

echo "replace the absolute path with $installPath"
# replace the absolute path with installation path
sed -i "s%/usr/local/IPTVStreaming%$installPath%g" $installPath/iptvstreaming
sed -i "s%/usr/local/IPTVStreaming%$installPath%g" $installPath/cfg/iptvstreaming.cfg
sed -i "s%/usr/local/IPTVStreaming%$installPath%g" $installPath/lib/functions
sed -i "s%/usr/local/IPTVStreaming%$installPath%g" $installPath/daemon/iptvstreamingd
sed -i "s%/usr/local/IPTVStreaming%$installPath%g" uninstall.sh

# for python command
echo 'install python...'
system=$(set `head -1 /etc/issue`;echo $1)
if (`test $system = 'CentOS'`); then
    yum -y install python
elif (`test $system = 'Ubuntu'`); then
    apt-get -y install python
else
    echo -e "[\033[1;31mWARNING:\033[0m] you should install python by yourself"
fi

# intallPathstall ffmpeg (default installed)

echo -e "[\033[1;32mSTATUS:\033[0m] Install successfully"
