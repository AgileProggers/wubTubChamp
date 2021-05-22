#!/bin/bash

# check cli args
if [ "$#" -lt 1 ]; then
       echo "./change_playlist.sh <youtube playlist url>"
       exit 1
else
       playlist=$1
fi

# playlist links to file
youtube-dl -j --flat-playlist "$playlist" | jq -r '.id' | sed 's_^_https://youtu.be/_' > playlist.txt