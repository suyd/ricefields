#!/bin/bash
SAUL="./saul.webm"
while : 
do
    mpv --loop-file $SAUL &
    sleep 2 
done
