#!/bin/bash

# check cli args
if [ "$#" -lt 2 ]; then
       echo "./stream.sh <rtmp stream url> <youtube playlist url>"
       exit 1
else
       rtmp_stream=$1
       playlist=$2

fi

# check for ffmpeg, mbuffer, youtube-dl and jq
if ! [ -x "$(command -v ffmpeg)" ]; then
       echo "ffmpeg not installed"
       exit 1
fi
if ! [ -x "$(command -v mbuffer)" ]; then
       echo "mbuffer not installed"
       exit 1
fi
if ! [ -x "$(command -v youtube-dl)" ]; then
       echo "youtube-dl not installed"
       exit 1
fi
if ! [ -x "$(command -v jq)" ]; then
       echo "jq not installed"
       exit 1
fi

# download playlist
if [ ! -d "cache" ]; then
       mkdir cache
fi
#youtube-dl -f bestaudio[acodec=opus]/best --download-archive cache.txt "$playlist" -o "cache/%(id)s.%(ext)s"

# run the loop
prev_song=""
while true; do
       # dont repeat songs
       next_song="$(find cache/ -type f | shuf -n 1)"
       while [ "$next_song" == "$prev_song" ]; do
              next_song="$(find cache/ -type f | shuf -n 1)"
       done
       prev_song=$next_song
       # ffmpeg pipe to mbuffer to ffmpeg
       ffmpeg -hide_banner -loglevel warning -i "$next_song" -vn -c:a copy -f mpegts -
done | mbuffer -q -c -m 50M | ffmpeg -re -hide_banner -loglevel warning -stats -stream_loop -1 -i wubTub.mp4 -i - -map 0:v -map 1:a -c:v copy -c:a aac -b:a 320k -ar 48k -af loudnorm=I=-23:TP=-1:LRA=9 -flags +global_header -f flv "$rtmp_stream"
