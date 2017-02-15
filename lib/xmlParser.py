import sys
import os
import xml.etree.ElementTree as ET

try:
    tree = ET.parse(sys.argv[1])
    root = tree.getroot()
    
    for stream in root.findall('Stream'):
        name = stream.findtext('streamName')
        source = stream.findtext('source')
        cmd = 'echo '+source+' > '+sys.argv[2]+'/'+name
        os.system(cmd)
except:
    sys.exit(1)

