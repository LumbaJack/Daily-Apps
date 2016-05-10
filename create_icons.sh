#!/bin/bash

usage() { echo "usage: $0 icon colour [dest_dir]"; exit 1; }

[ "$1" ] && [ "$2" ] || usage
[ "$3" ] || set "$1" "$2" "."

devices=android
eval mkdir -p "$3/res/{icon,screen}/{$devices}"

# Explicitly set background in case image is transparent (see: #3)
convert="convert -background none"
$convert "$1" -resize 128x128 "$3/res/icon/icon.png"
$convert "$1" -resize 36x36 "$3/res/icon/android/icon-36-ldpi.png"
$convert "$1" -resize 72x72 "$3/res/icon/android/icon-72-hdpi.png"
$convert "$1" -resize 48x48 "$3/res/icon/android/icon-48-mdpi.png"
$convert "$1" -resize 96x96 "$3/res/icon/android/icon-96-xhdpi.png"
