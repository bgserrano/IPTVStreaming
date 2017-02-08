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
cp -r bin/ lib/ cfg/ $installPath

echo "replace the absolute path with $installPath"
# replace the absolute path with installation path
sed -i "s%/usr/local/IPTVStreaming%$installPath%g" $installPath/iptvstreaming
sed -i "s%/usr/local/IPTVStreaming%$installPath%g" $installPath/cfg/iptvstreaming.cfg
sed -i "s%/usr/local/IPTVStreaming%$installPath%g" $installPath/lib/functions
sed -i "s%/usr/local/IPTVStreaming%$installPath%g" $installPath/bin/iptvd
sed -i "s%/usr/local/IPTVStreaming%$installPath%g" uninstall.sh

# for xmllint command
echo 'yum install xmllint'
#yum -y install libxml2
#apt-get install libxml2-utils

# intallPathstall ffmpeg (default installed)

echo 'Install successfully'
