## Intrduction

`IPTVStreaming` is a hls streaming tool, which can be used to stream video source to hls file.

* Streaming the source to hls
* Control the streaming by service

## Installation

`IPTVStreaming` is available on GitHub, you can clone and install it as follows:

$ git clone https://github.com/lazarangelov/IPTVStreaming.git  
$ cd IPTVStreaming  
$ ./install.sh

After installation, you may see these file in /usr/local/IPTVStreaming folder:
* iptvstreaming, is a control program;
* cfg/iptvstreaming.cfg, which is IPTVStreaming's main configuration file;
* daemon/iptvstreamingd, is used to check the status of all streams every 30 seconds;
* lib/functions, is main function library used by IPTVStreaming;
* lib/xmlParser.py, is used to parse xml file

## Configuration

* if your server is `Ubuntu` operating system, please change the default shell environment dash to bash using command: `sudo dpkg-reconfigure dash`
* you must make sure the server's `hostname` is same as the information stored in database:
    * CentOS: vim /etc/sysconfig/network, add or modify HOSTNAME=name
    * Ubuntu: vim /etc/hostname, modify hostname directly
* you cn modify the installation path which is /usr/local/IPTVStreaming by default in install.sh
* you can get stream information(name,source) from database or xml file by set streamOrigin in cfg/iptvagent.cfg and cached is used to cache the information retrieved from database
* if you set streamOrigin=xml,you should provide a streams.xml file and put it to xml path configured in iptvstreaming.cfg file, xml file format as follows:  
    ``` xml
    
    <message>  
        <Stream>  
            <streamName></streamName>  
            <source></source>  
            <server></server>  
        </Stream>  
        <Stream>  
        ...  
        </Stream>  
    </message>
    ```
* you can also modify the hls path, log path and pid path, which will be created when iptvstreaming start
* set check interval whatever you want 

## Usage

/usr/local/IPTVStreaming start|stop|restart|status
