# wubTubChamp

Stream looping video with random audio of a YouTube playlist to rtmp.

# Requirements

* ffmpeg
* mbuffer
* youtube-dl
* jq

# Example

./stream.sh "https://youtube.com/playlist?list=PLV2ewAgCPCq0DVamOw2sQSAVdFVjA6x78" "rtmp://fra02.contribute.live-video.net/app/{stream_key}"

# Might be useful

You can change the playlist at any time by editing the `playlist.txt` file. Just add or remove songs.