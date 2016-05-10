#!/bin/bash -x
CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR=$(ls -d $CWD/*/)
VER="1.3.1"
for d in $DIR; do
   if [ -f $d/www/config.xml ]; then
      cp $CWD/ant.properties $d/platforms/android/
      cp $CWD/custom_rules.xml $d/platforms/android/
      curbuild=$(cat $d/platforms/android/AndroidManifest.xml |grep -o '[<]*android:versionCode="[0-9]*"'|cut -d\" -f2)
      ((curbuild++))
      sed -i 's/android:debuggable="true"/android:debuggable="false"/g'  $d/platforms/android/AndroidManifest.xml
      sed -i "s/[<]*android:versionName=\"[0-9.]*\"/android:versionName=\"$VER\"/g"  $d/platforms/android/AndroidManifest.xml
      sed -i "s/[<]*android:versionCode=\"[0-9]*\"/android:versionCode=\"$curbuild\"/g"  $d/platforms/android/AndroidManifest.xml
      $CWD/copyres.sh $d
      cd $d/platforms/android/ && ant clean
      cd $d/platforms/android/ && ant release
   fi
done
find $CWD -iname "*release.apk" -exec cp {} $CWD/apks \;
