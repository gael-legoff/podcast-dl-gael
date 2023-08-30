#!/bin/bash

YOUTUBE_DL="$SNAP_COMMON"/podcast-dl/bin/youtube-dl
ARCHIVE_FILE="$SNAP_COMMON"/podcast-dl/youtube-dl.conf.d/youtube-dl.download.archive

if [[ "$#" -ne 1 ]]; then
   echo "Usage: $0 URL"
   exit 1
fi

# Download or update yt-dlp to the latest version

if [[ ! -f "$YOUTUBE_DL" ]]; then

   curl --silent --location https://github.com/yt-dlp/yt-dlp/releases/download/2023.07.06/yt-dlp --output "$YOUTUBE_DL"
   chmod a+rx "$YOUTUBE_DL"
else

   "$YOUTUBE_DL" --update
fi

# Get Youtube video IDs

echo "Retrieving Youtube video IDs. This could take a very long time..."

YT_DL_ID_LIST=$("$YOUTUBE_DL" --get-id --ignore-errors --download-archive "$SNAP_COMMON"/podcast-dl/youtube-dl.conf.d/youtube-dl.download.archive --no-continue --cookies "$SNAP_COMMON"/podcast-dl/youtube-dl.conf.d/youtube-dl.cookies "$1")

if [[ "$?" -ne 0 ]]; then
   echo "Something went wrong."
   exit 1
fi

# Save Youtube video IDs in the archive file

echo "$YT_DL_ID_LIST" | while IFS= read -r YT_ID
do
   echo "youtube $YT_ID" >> "$ARCHIVE_FILE"
done

exit 0
