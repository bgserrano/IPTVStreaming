#! /bin/bash

echo 'Start to install IPTV streaming'

# installation path of iptv streaming program, can be modified
installPath=/usr/local/IPTVStreaming

if [ ! -d $installPath ]; then
    mkdir -p $installPath
fi

echo 'copy service to /etc/init.d'
cp iptvstreaming /etc/init.d/

echo "copy iptv streaming to $installPath"
cp -r bin/ lib/ cfg/ $installPath

echo "replace the absolute path with $installPath"
# replace the absolute path with installation path
sed -in "s%/usr/local/IPTVStreaming%$installPath%g" /etc/init.d/iptvstreaming
sed -in "s%/usr/local/IPTVStreaming%$installPath%g" $installPath/cfg/iptvstreaming.cfg
sed -in "s%/usr/local/IPTVStreaming%$installPath%g" $installPath/lib/functions
sed -in "s%/usr/local/IPTVStreaming%$installPath%g" $installPath/bin/iptvd

# for xmllint command
echo 'yum install xmllint'
#yum -y install libxml2

# intallPathstall ffmpeg (default installed)

echo 'Install successfully'
