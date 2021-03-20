# [podcast-dl-gael](https://snapcraft.io/podcast-dl-gael)

A simple script I use to download podcasts from YouTube and RSS feeds. It uses [youtube-dl](https://youtube-dl.org/) and a (badly) written bash script. Files are then synchronized to my laptop and mobile using [syncthing](https://snapcraft.io/syncthing-gael).

**Caveat:** It suits MY needs and is provided as-is. It's FOSS. Use it for whatever you want.

**Usage**

* List your YouTube video or playlist URLs here (one Youtube URL per line)
```
sudo vi /var/snap/podcast-dl-gael/common/podcast-dl/youtube-dl.conf.d/youtube-dl.url
```

* List your RSS feeds here (one RSS feed per line)
```
sudo vi /var/snap/podcast-dl-gael/common/podcast-dl/rss-dl.conf.d/rss-dl.url
```

* Podcasts are downloaded here once a day at 06:00
```
ls -lh /var/snap/podcast-dl-gael/common/podcast-dl/podcasts/
```

* Display the last/next time podcast-dl has/will run
```
systemctl list-timers | grep -e NEXT -e podcast-dl-gael
```

**2021-03-20**
* Initial release
