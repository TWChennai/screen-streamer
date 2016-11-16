#!/bin/sh

SERVER="rtmp://10.17.1.109:4000/live"


MACHINE_TYPE=`uname -m`
#if [ ${MACHINE_TYPE} == 'x86_64' ]; then
  BIN="./bin/linux/x64/ffmpeg"
#else
#  BIN="./bin/linux/x32/ffmpeg"
#fi

$BIN -f x11grab -s `xdpyinfo | grep -i dimensions: | sed 's/[^0-9]*pixels.*(.*).*//' | sed 's/[^0-9x]*//'` -i :0.0 -preset ultrafast -tune zerolatency -r 1 -f flv $SERVER
