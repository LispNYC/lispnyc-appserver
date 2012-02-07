#!/bin/bash

if [ -a ~/home.war ]; then
    echo "found ~/home.war"
else
    echo "ERROR: ~/home.war missing"
    exit 1
fi

if [ -d ./webapps/home ]; then
    echo "found ./webapps/home"
else
    echo "ERROR: ./webapps/home missing"
    exit 1
fi

rm -rf ./webapps/home
mkdir  ./webapps/home
pushd ./webapps/home
$JAVA_HOME/bin/jar -xvf ~/home.war
popd 
