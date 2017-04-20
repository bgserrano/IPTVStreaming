#! /bin/bash


installSoftware() {
    if [ $1 = redis ]; then
        soft=`which redis-server 2>&1`
    else
        soft=`which $1 2>&1`
    fi
    if [ $? -eq 0 ]; then
        return 0
    fi
    echo -e "[\033[1;32mINFO:\033[0m] Install $1 ..."
    system=$(head -1 /etc/issue|awk '{print $1}')
    if [ $system = CentOS ]; then
        yum -y install $1
    elif [ $system = Ubuntu ]; then
        if [ $1 = redis ]; then
            apt-get -y install redis-server
        else
            apt-get -y install $1
        fi
    else
        echo -e "[\033[1;31mWARNING:\033[0m] you should install $1 by yourself"
    fi    
}
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

# install necessary softwar
installSoftware python
installSoftware redis

# intallPathstall ffmpeg (default installed)

echo -e "[\033[1;32mSTATUS:\033[0m] Install successfully"
