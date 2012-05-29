#!/bin/bash

if [ -d ./webapps/home ]; then
    echo "found ./webapps/home"
else
    echo "ERROR: build and deploy the lispnyc-homebase-app,"
    echo "see https://github.com/LispNYC/lispnyc-homebase-app"
    exit 1
fi

# TODO: remove when JspWiki 3.0 arrives, it supports execution from war
if [ -d ./webapps/wiki ]; then
    echo "found ./webapps/wiki"
else
    echo "expainding wiki.war..."
    mkdir ./webapps/wiki
    cd ./webapps/wiki
    jar -xf ../wiki.war
    cd ../..
    rm webapps/wiki.war
fi

if [ -d ./logs ]; then
    echo "found ./logs"
else
    echo "creating logs directory (ignored by checkout)"
    mkdir ./logs
fi


# NOTE: useragent is set for google group access, otherwise we're locked out
AGENT="Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:10.0.1) Gecko/20100101 Firefox/10.0.1"
if [ -d "$JAVA_HOME/bin/java" ] ; then 
  echo "JAVA_HOME is at ${JAVA_HOME}..."
  ${JAVA_HOME}/bin/java -Dhttp.agent="${AGENT}" -jar start.jar
else
 java -Dhttp.agent="${AGENT}" -jar start.jar 
fi
