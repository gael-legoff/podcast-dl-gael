#!/bin/bash

### RSS downloads ###

for URL in $(grep '^[[:blank:]]*[^[:blank:]#;]' $SNAP_COMMON/podcast-dl/rss-dl.conf.d/rss-dl.url)
do
   $SNAP/podcast-dl/rss-dl.conf.d/rss-dl.module $URL
done

### YouTube downloads ###

$SNAP/podcast-dl/youtube-dl.conf.d/youtube-dl.module

exit 0
