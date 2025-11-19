#!/bin/bash

# Check the service
echo -e "Check the service"

snap services podcast-dl-gael.podcast-dl

# Cleanup
echo -e "\nCleanup"

sudo rm -f /var/snap/podcast-dl-gael/common/podcast-dl/rss-dl.conf.d/rss-dl.url
sudo rm -f /var/snap/podcast-dl-gael/common/podcast-dl/rss-dl.conf.d/rss-dl.download.archive

sudo rm -f /var/snap/podcast-dl-gael/common/podcast-dl/youtube-dl.conf.d/youtube-dl.url
sudo rm -f /var/snap/podcast-dl-gael/common/podcast-dl/youtube-dl.conf.d/youtube-dl.download.archive

sudo rm -rf /var/snap/podcast-dl-gael/common/podcast-dl/podcasts/*

# Test RSS feeds on a clean archive
echo -e "\nAdd RSS feeds"

echo "https://linuxmatters.sh/episode/index.xml /var/snap/podcast-dl-gael/common/podcast-dl/podcasts/LM" | sudo tee /var/snap/podcast-dl-gael/common/podcast-dl/rss-dl.conf.d/rss-dl.url > /dev/null
echo "https://latenightlinux.com/feed/extra" | sudo tee -a "/var/snap/podcast-dl-gael/common/podcast-dl/rss-dl.conf.d/rss-dl.url" > /dev/null

# Skip all the episodes
echo -e "\nSkip the episodes"

sudo podcast-dl-gael.rss-skip-download https://linuxmatters.sh/episode/index.xml
sudo podcast-dl-gael.rss-skip-download https://latenightlinux.com/feed/extra

# Check the number of episodes skipped
echo -e "\nNumber of episodes skipped"

sudo wc -l /var/snap/podcast-dl-gael/common/podcast-dl/rss-dl.conf.d/rss-dl.download.archive

# Remove a guid from each feed in the RSS archive
echo -e "\nRemove a guid from each feed"

sudo sed -i '/https:\/\/audio.linuxmatters.net\/LMP64.mp3/d' /var/snap/podcast-dl-gael/common/podcast-dl/rss-dl.conf.d/rss-dl.download.archive
sudo sed -i '/https:\/\/latenightlinux.com\/?p=3565/d' /var/snap/podcast-dl-gael/common/podcast-dl/rss-dl.conf.d/rss-dl.download.archive

# Download all the missing files and check them
echo -e "\nDownload the missing files"

sudo podcast-dl-gael.download-now

sudo ls -lRh /var/snap/podcast-dl-gael/common/podcast-dl/podcasts

# Remove one of the destination folder, download files again and check no empty folders were created
echo -e "\nRemove one of the destination folder, download files again"

sudo rm -rf /var/snap/podcast-dl-gael/common/podcast-dl/podcasts/LM
sudo podcast-dl-gael.download-now

sudo ls -lRh /var/snap/podcast-dl-gael/common/podcast-dl/podcasts


# Cleanup
echo -e "\nCleanup"

sudo rm -f /var/snap/podcast-dl-gael/common/podcast-dl/rss-dl.conf.d/rss-dl.url
sudo rm -f /var/snap/podcast-dl-gael/common/podcast-dl/rss-dl.conf.d/rss-dl.download.archive

sudo rm -f /var/snap/podcast-dl-gael/common/podcast-dl/youtube-dl.conf.d/youtube-dl.url
sudo rm -f /var/snap/podcast-dl-gael/common/podcast-dl/youtube-dl.conf.d/youtube-dl.download.archive

sudo rm -rf /var/snap/podcast-dl-gael/common/podcast-dl/podcasts/*

# Test yt-dlp on a clean archive

# Skip all the tracks of a playlist
echo -e "\nSkip all the tracks"

sudo podcast-dl-gael.youtube-dl-skip-download https://www.youtube.com/watch?list=PLV3QObPp4Pie78Ye0bVGk23aAC7WsPUhK

# Check the number of tracks skipped
echo -e "\nCheck the number of tracks skipped"

sudo wc -l /var/snap/podcast-dl-gael/common/podcast-dl/youtube-dl.conf.d/youtube-dl.download.archive

# Remove the 1st line of the download archive
echo -e "\nRemove the 1st line of the download archive"

sudo sed -i '1d' /var/snap/podcast-dl-gael/common/podcast-dl/youtube-dl.conf.d/youtube-dl.download.archive

echo -e "\nAdd a YouTube list"

echo "https://www.youtube.com/watch?list=PLV3QObPp4Pie78Ye0bVGk23aAC7WsPUhK" | sudo tee /var/snap/podcast-dl-gael/common/podcast-dl/youtube-dl.conf.d/youtube-dl.url > /dev/null

# Download all the remaining videos and check them
echo -e "\nDownload all the remaining files"

sudo podcast-dl-gael.download-now

sudo ls -lRh /var/snap/podcast-dl-gael/common/podcast-dl/podcasts
