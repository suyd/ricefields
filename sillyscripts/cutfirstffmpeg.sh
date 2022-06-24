for i in *.mp4;do ffmpeg -i "$i" -ss 5 -c copy "edited ${i%.*}.mp4"; done
