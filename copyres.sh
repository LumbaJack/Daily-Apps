#!/bin/bash -x

CWD=$(cd $(dirname "$0"); pwd) 
DIR=$1

echo $DIR

##Icons
cp -a $DIR/www/res/icon/android/icon-*-ldpi* $DIR/platforms/android/res/drawable-ldpi/icon.png
cp -a $DIR/www/res/icon/android/icon-*-mdpi* $DIR/platforms/android/res/drawable-mdpi/icon.png
cp -a $DIR/www/res/icon/android/icon-*-hdpi* $DIR/platforms/android/res/drawable-hdpi/icon.png
cp -a $DIR/www/res/icon/android/icon-*-xhdpi* $DIR/platforms/android/res/drawable-xhdpi/icon.png
cp -a $DIR/www/res/icon/android/icon-*-xhdpi* $DIR/platforms/android/res/drawable/icon.png

cp -a $DIR/www/res/screen/android/screen*-hdpi* $DIR/platforms/android/res/drawable-hdpi/splash.png
cp -a $DIR/www/res/screen/android/screen*ldpi* $DIR/platforms/android/res/drawable-ldpi/splash.png
cp -a $DIR/www/res/screen/android/screen*mdpi* $DIR/platforms/android/res/drawable-mdpi/splash.png
cp -a $DIR/www/res/screen/android/screen*xhdpi* $DIR/platforms/android/res/drawable-xhdpi/splash.png


