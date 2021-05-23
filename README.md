# wubTubChamp

Stream looping video with random audio of a YouTube playlist to rtmp.

## Requirements

* ffmpeg
* mbuffer
* youtube-dl
* jq

## Example

```bash
./stream.sh "https://youtube.com/playlist?list=PLV2ewAgCPCq0DVamOw2sQSAVdFVjA6x78" "rtmp://fra02.contribute.live-video.net/app/{stream_key}"
```

## Might be useful

You can change the playlist at any time by editing the `playlist.txt` file. Just add or remove songs or use the included script.

```bash
./change_playlist.sh "https://youtube.com/playlist?list=PLV2ewAgCPCq0DVamOw2sQSAVdFVjA6x78"
```

## To do

- [ ] Completely download songs for caching before playing to prevent [#1](https://github.com/AgileProggers/wubTubChamp/issues/1). Streaming the video seems to break songs every now and then. Delete songs after streamed.