#!/bin/bash

# Start libreoffice-headless
/usr/bin/soffice --headless --nologo --nofirststartwizard --accept="socket,host=127.0.0.1,port=8100;urp" &

# Start jodconverter
#/opt/jodconverter-tomcat-2.2.2/bin/startup.sh
/opt/jodconverter-tomcat-2.2.2/bin/catalina.sh run
