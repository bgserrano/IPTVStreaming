#! /bin/bash

installPath=/usr/local/IPTVStreaming

count=`ps -ef|grep iptvstreamingd|grep -v grep|wc -l`
if [ $count -ne 0 ]; then
    $installPath/iptvstreaming stop
fi

echo "uninstall iptv streaming..."

# remove deloyed iptv stremaing
if [ -d $installPath ]; then
    rm -rf $installPath 
fi

echo -e "[\033[1;32mSTATUS:\033[0m] uninstall successfully"
