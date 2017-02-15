#! /bin/bash

installPath=/usr/local/IPTVStreaming

count=`ps -ef|grep iptvstreamingd|grep -v grep|wc -l`
if [ $count -ne 0 ]; then
    echo -e "[\033[1;32mINFO:\033[0m] Stop iptvagent..."
    $installPath/iptvstreaming stop
fi

echo -e "[\033[1;32mINFO:\033[0m] Uninstall iptv streaming..."

# remove deployed iptv stremaing
if [ -d $installPath ]; then
    rm -rf $installPath 
fi

echo -e "[\033[1;32mSTATUS:\033[0m] uninstall successfully"
