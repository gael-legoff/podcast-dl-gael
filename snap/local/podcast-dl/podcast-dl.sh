#!/bin/bash

RSS_DL_URL=$SNAP_COMMON/podcast-dl/rss-dl.conf.d/rss-dl.url
YOUTUBE_DL_URL=$SNAP_COMMON/podcast-dl/youtube-dl.conf.d/youtube-dl.url

### RSS downloads ###

if [[ -f "$RSS_DL_URL" ]]; then

   grep '^[[:blank:]]*[^[:blank:]#;]' < "$RSS_DL_URL" | while IFS= read -r ARGS
   do
      "$SNAP"/podcast-dl/rss-dl.conf.d/rss-dl.module DOWNLOAD $ARGS
   done
fi

### YouTube downloads ###

if [[ -f "$YOUTUBE_DL_URL" ]]; then

   "$SNAP"/podcast-dl/youtube-dl.conf.d/youtube-dl.module
fi

exit 0
