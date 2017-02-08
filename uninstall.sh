#! /bin/bash

installPath=/usr/local/IPTVStreaming

count=`ps -ef|grep iptvd|grep -v grep|wc -l`
if [ $count -ne 0 ]; then
    $installPath/iptvstreaming stop
fi

echo "uninstall iptv streaming..."

# remove deloyed iptv stremaing
if [ -d $installPath ]; then
    rm -rf $installPath 
fi

echo "uninstall successfully"
