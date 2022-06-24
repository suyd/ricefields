#!/bin/bash
SAUL=".local/bin/saul.webm"
while : 
do
    mpv --loop-file $SAUL &
    sleep 2 
done
