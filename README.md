# [podcast-dl-gael](https://snapcraft.io/podcast-dl-gael)

A simple script to download videos/podcasts from YouTube or RSS feeds.

Behind the scene it uses [youtube-dl](https://youtube-dl.org/) and Python's feedparser.

### YouTube videos (or any other services supported by youtube-dl)

* List your YouTube video or playlist URLs here (one URL per line)
```
sudo vi /var/snap/podcast-dl-gael/common/podcast-dl/youtube-dl.conf.d/youtube-dl.url
```

* Configure youtube-dl here
```
sudo vi /var/snap/podcast-dl-gael/common/podcast-dl/youtube-dl.conf.d/youtube-dl.conf
```

### RSS feeds

* List your RSS feeds here (one RSS feed per line)
```
sudo vi /var/snap/podcast-dl-gael/common/podcast-dl/rss-dl.conf.d/rss-dl.url
```

### Target directory

* New files are downloaded here everyday at 06:00
```
ls -l /var/snap/podcast-dl-gael/common/podcast-dl/podcasts/
```

### Revisions

**2022-04-29**
* New build to resolve CVE-2022-22576/CVE-2022-27774/CVE-2022-27775/CVE-2022-27776/USN-5397-1

**2022-04-01**
* v2.0 available on amd64, arm64 & armhf
* Switched to Python's feedparser for reliability

**2022-02-23**
* New build to resolve CVE-2022-24407/USN-5301-1

**2021-09-16**
* New build to resolve CVE-2021-22947/CVE-2021-22945/CVE-2021-22946/USN-5079-1

**2021-08-27**
* New build to resolve CVE-2021-3634/USN-5053-1

**2021-07-23**
* New build to resolve CVE-2021-22898/CVE-2021-22924/CVE-2021-22925/USN-5021-1

**2021-04-14**
* New build to resolve CVE-2021-20305/USN-4906-1

**2021-04-01**
* New build to resolve CVE-2021-22876/CVE-2021-22890/USN-4898-1

**2021-03-26**
* New build to resolve CVE-2021-3449/USN-4891-1

**2021-03-20**
* Initial release

