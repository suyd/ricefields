#!/bin/sh

for i in *.mp4
do
	duration=$(ffprobe -v error -show_entries format=duration -of csv=p=0 "$i")
	sectoremove=$(echo $duration - 20.0 | bc)
	
	ffmpeg -t $sectoremove -i "$i" -c copy "cutlast ${i%.*}.mp4"
done

