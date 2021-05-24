# wubTubChamp

Stream looping video with random audio of a YouTube playlist to rtmp.

## Requirements

* ffmpeg
* mbuffer
* youtube-dl
* jq

## Example

```bash
./stream.sh "rtmp://fra02.contribute.live-video.net/app/{stream_key}" "https://www.youtube.com/playlist?list=PLeMER9rHllyCpdkCTvOMLe1qJV3LVKxzI"
```

## Might be useful

You can change songs at any time by adding or removing files from the `cache` dir. If you do so, keep in mind that modifing the cache dir makes the `cache.txt` file incorrect, which keeps track of all downloaded tracks.
