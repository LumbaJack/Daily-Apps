#!/bin/bash
CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR=$(ls -d $CWD/*/)
for d in $DIR; do
   if [ -f $d/www/config.xml ]; then
      $CWD/create_icons.sh  $d/www/icon.png black $d/www/
      $CWD/copyres.sh $d
      #cd $d && phonegap local plugin add /tmp/plugins/com.google.cordova.plugin.AdMobPlugin
      #cd $d && phonegap local plugin add /tmp/plugins/com.phonegap.plugins.PushPlugin
      #cd $d && phonegap local plugin add /tmp/plugins/com.plugins.shortcut
      #cd $d && phonegap local plugin add /tmp/plugins/nl.x-services.plugins.socialsharing
      #cd $d && phonegap local plugin add org.apache.cordova.camera
      #cd $d && phonegap local plugin add org.apache.cordova.device
      #cd $d && phonegap local plugin add org.apache.cordova.dialogs
      #cd $d && phonegap local plugin add org.apache.cordova.file
      #cd $d && phonegap local plugin add org.apache.cordova.file-transfer
      #cd $d && phonegap local plugin add org.apache.cordova.globalization
      #cd $d && phonegap local plugin add org.apache.cordova.network-information
      cd $d/platforms/android/ && phonegap build android
   fi
done
find $CWD -iname "*debug.apk" -exec cp {} $CWD\apks \;
