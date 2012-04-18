#!/bin/sh
# note: useragent is set for google group access, otherwise we're locked out
$JAVA_HOME/bin/java -Dhttp.agent="Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:10.0.1) Gecko/20100101 Firefox/10.0.1" -jar start.jar 
