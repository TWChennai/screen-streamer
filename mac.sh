#!/bin/bash -e

SERVER="rtmp://10.17.1.109:4000/live;"

BIN="bin/darwin/x64/ffmpeg"
LIST_COMMAND="-f avfoundation -list_devices true -i \"\""
STREAM_COMMMAND="-f avfoundation -i $2  -preset ultrafast -tune zerolatency -r 10 -f flv $SERVER"

if [ "$1" == "list" ]; then
  ARGS=$LIST_COMMAND
elif [ "$1" == "stream" ]; then
  ARGS=$STREAM_COMMMAND
else
  echo "Possible arguments: list, stream <device-id>"
  exit
fi

COMMAND="$BIN $ARGS"
echo "COMMAND: $COMMAND"
eval $COMMAND
