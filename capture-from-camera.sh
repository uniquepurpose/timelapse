#!/bin/bash
counter=0

until [ $counter -gt 5 ]
do
 TIMESTAMP=`date +%Y-%m-%d_%H-%M-%S`
 # works with Hikvision
 wget --user username --password password http://camera/Streaming/channels/1/picture -O $TIMESTAMP.jpg
 sleep 5
done
