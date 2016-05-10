#!/bin/bash
CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR=$(ls -d $CWD/*/)
for d in $DIR; do
   if [ -f $d/www/config.xml ]; then
       cd $d  && cordova platform remove android
   fi
done
