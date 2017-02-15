#! /bin/bash

installPath=/usr/local/IPTVStreaming

count=`ps -ef|grep iptvstreamingd|grep -v grep|wc -l`
if [ $count -ne 0 ]; then
    echo "stop iptvagent..."
    $installPath/iptvstreaming stop
fi

echo "uninstall iptv streaming..."

# remove deployed iptv stremaing
if [ -d $installPath ]; then
    rm -rf $installPath 
fi

echo -e "[\033[1;32mSTATUS:\033[0m] uninstall successfully"
