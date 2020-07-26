#!/bin/bash
# Requires imagemagick and ffmpeg.

for img in *.jpg
do

# Create timestamps from filename for watermark
timestamp=${img//_/ }
timestamp=${timestamp//.jpg/}
date=$(echo $timestamp | cut -d ' ' -f1)
time=$(echo $timestamp | cut -d ' ' -f2)
time=${time/-/:}
time=${time/-/:}

# Add timestamps as watermark 
convert $img -fill white -undercolor '#00000080' -gravity NorthWest -pointsize 40 -font Noto-Mono -annotate +30+30 "$date $time" "stamped_""$img";
done

# Create MJPEG
ffmpeg -pattern_type glob -i "stamped_*.jpg" -r 30 $date.avi
