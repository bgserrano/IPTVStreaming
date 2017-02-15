#! /bin/bash

echo -e "[\033[1;32mINFO:\033[0m] Start to install IPTV streaming"

# installation path of iptv streaming program, can be modified
installPath=/usr/local/IPTVStreaming

if [ ! -d $installPath ]; then
    mkdir -p $installPath
fi

echo -e "[\033[1;32mINFO:\033[0m] Copy iptvstreaming service to $installPath"
cp iptvstreaming $installPath

echo -e "[\033[1;32mINFO:\033[0m] Copy iptv streaming to $installPath"
cp -r daemon/ lib/ cfg/ $installPath

echo -e "[\033[1;32mINFO:\033[0m] Replace the absolute path with $installPath"
# replace the absolute path with installation path
sed -i "s%/usr/local/IPTVStreaming%$installPath%g" `grep /usr/local/IPTVStreaming -rl $installPath`
sed -i "s%/usr/local/IPTVStreaming%$installPath%g" uninstall.sh

# for python command
echo -e "[\033[1;32mINFO:\033[0m] Install python..."
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
