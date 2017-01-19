#! /bin/bash

/etc/init.d/iptvstreaming stop

# remove the service
if [ -f /etc/init.d/iptvstreaming ]; then
    rm /etc/init.d/iptvstreaming
fi

if [ -f /etc/rc.d/init.d/iptvstreaming ]; then
    rm /etc/rc.d/init.d/iptvstreaming
fi

# remove deloyed iptv stremaing
if [ -d /usr/local/IPTVStreaming ]; then
    rm -rf /usr/local/IPTVStreaming
fi
