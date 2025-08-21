# [podcast-dl-gael](https://snapcraft.io/podcast-dl-gael)

A simple script to download videos/podcasts from YouTube or RSS feeds.

Behind the scene it uses [yt-dlp](https://github.com/yt-dlp/yt-dlp) and Python's feedparser.


### Connect the home interface to download files to the home directory (optional)
```
sudo snap connect podcast-dl-gael:home
```


### YouTube videos (or any other services supported by yt-dlp)

* List your YouTube video or playlist URLs here (one URL per line)
```
sudo vi /var/snap/podcast-dl-gael/common/podcast-dl/youtube-dl.conf.d/youtube-dl.url

# Jay Swanson
https://www.youtube.com/user/Cadelfwch/videos

# SmarterEveryDay
https://www.youtube.com/user/destinws2/videos
```

* Configure yt-dlp here
```
sudo vi /var/snap/podcast-dl-gael/common/podcast-dl/youtube-dl.conf.d/youtube-dl.conf
```


### RSS feeds

* List your RSS feeds here (one RSS feed per line)
```
sudo vi /var/snap/podcast-dl-gael/common/podcast-dl/rss-dl.conf.d/rss-dl.url

# Format: URL [DIRECTORY]
# The optional DIRECTORY allows you to the save your files in a specific directory

# Late Night Linux - All Episodes Feed
https://latenightlinux.com/feeds/ /root/storage/podcasts/LateNightLinux
```


### Scheduled downloads

* By default, new files are downloaded here everyday at 6am
```
ls -lh /var/snap/podcast-dl-gael/common/podcast-dl/podcasts/
```


### Manually scheduling or downloading files

To download files at a different time, use a systemd timer (or equivalent) to run this command

```
sudo podcast-dl-gael.download-now
```

This command can also be run from the command line to download files manually.


### Skip YouTube videos

To mark videos as already downloaded, run the youtube-dl-skip-download command.
Depending on the number of videos, this could take a long time.

If you don't want to watch (again) the 1300+ first vlogs of Jay Swanson but would like to download the future ones, run this command 

```
sudo podcast-dl-gael.youtube-dl-skip-download https://www.youtube.com/user/Cadelfwch/videos
```


### Skip RSS feeds

To mark RSS feeds as already downloaded, run the rss-skip-download command.

If you don't want to listen (again) to all the Late Night Linux shows but would like to download the future ones, run this command 

```
sudo podcast-dl-gael.rss-skip-download https://latenightlinux.com/feeds/
```


### Revisions

**2025-08-21**
* New build to resolve CVE-2025-6021/CVE-2025-6170/CVE-2025-49794/CVE-2025-49796/USN-7694-1

**2025-07-23**
* New build to resolve CVE-2025-6199/CVE-2025-7345/USN-7662-1

**2025-07-17**
* New build to resolve CVE-2023-0645/CVE-2023-35790/CVE-2024-11403/CVE-2024-11498/USN-7637-1

**2025-07-08**
* New build to resolve CVE-2025-4877/CVE-2025-4878/CVE-2025-5318/CVE-2025-5449/USN-7619-1

**2025-06-27**
* New build to resolve CVE-2025-50181/CVE-2025-50182/USN-7599-1

**2025-06-20**
* Ship yt-dlp instead of downloading it from GitHub (this will prevent some weird corrupted installs)
* New build to resolve CVE-2023-32681/CVE-2024-47081/USN-7568-1

**2025-04-30**
* Improve python code
* Stop creating target directories when there is nothing to download
* New build to resolve CVE-2025-32414/CVE-2025-32415/USN-7467-1

**2025-03-12**
* New build to resolve CVE-2024-11053/CVE-2024-56826/CVE-2024-56827/CVE-2024-34459/CVE-2022-49043/CVE-2024-50612/CVE-2025-24928/CVE-2025-27113/CVE-2024-34459/CVE-2024-56171/USN-7162-1/USN-7223-1/USN-7240-1/USN-7267-2/USN-7302-1

**2024-12-07**
* Properly convert restricted UNIX and Windows characters in filenames with their unicode equivalents
* It will also help on Android when the exposed filesystem is FAT-like
* Update default yt-dlp to the latest version

**2024-11-06**
* podcast-dl-gael will now use core24 as most users are on Ubuntu 24.04

**2024-10-05**
* Add a fake user agent to workaround annoying podcast hosting sites (I'm looking at you podcastics.com)

**2024-09-21**
* Bundle ffmpeg, it was previously dropped by mistake
* Fix defaults for yt-dlp
* Fix logic

**2024-09-17**
* New build to resolve CVE-2024-8096/USN-7012-1

**2024-08-06**
* New build to resolve CVE-2024-7264/USN-6944-1

**2024-05-22**
* New build to resolve CVE-2024-3651/USN-6780-1

**2024-04-26**
* New build to resolve CVE-2024-28182/USN-6754-1

**2024-03-28**
* New build to resolve CVE-2024-2398/USN-6718-1

**2024-01-31**
* New build to resolve CVE-2023-2953/USN-6616-1

**2023-10-12**
* New build to resolve CVE-2023-38545/CVE-2023-38546/USN-6429-1

**2023-10-07**
* Back to stable releases of yt-dlp

**2023-09-06**
* v3.0 available on amd64, arm64 & armhf
* yt-dlp updated to nightly to workaround [Unable to extract initial state](https://github.com/yt-dlp/yt-dlp/issues/7624)
* New commands (youtube-dl-skip-download & rss-skip-download) to skip videos or RSS feeds
* Manual scheduling of downloads using the download-now command

**2023-08-16**
* New build to resolve CVE-2022-48281/CVE-2023-2908/CVE-2023-3316/CVE-2023-3618/CVE-2023-25433/CVE-2023-26965/CVE-2023-26966/CVE-2023-38288/CVE-2023-38289/USN-6290-1

**2023-08-02**
* New build to resolve CVE-2023-38633/USN-6266-1

**2023-07-20**
* New build to resolve CVE-2023-28321/CVE-2023-28322/CVE-2023-32001/USN-6237-1

**2023-07-06**
* yt-dlp updated to v2023.07.06
* Fixes CVE-2023-35934

**2023-06-21**
* yt-dlp updated to v2023.06.21

**2023-06-16**
* New build to resolve CVE-2023-3138/USN-6168-1

**2023-06-06**
* New build to resolve CVE-2023-1667/CVE-2023-2283/USN-6138-1
* yt-dlp updated to v2023.03.04

**2023-05-17**
* New build to resolve CVE-2023-1999/USN-6078-1

**2023-05-10**
* New build to resolve CVE-2023-2004/USN-6062-1

**2023-04-20**
* New build to resolve CVE-2023-29469/CVE-2023-28484/USN-6028-1

**2023-03-21**
* New build to resolve CVE-2023-27533/CVE-2023-27534/CVE-2023-27535/CVE-2023-27536/CVE-2023-27538/USN-5964-1

**2023-03-07**
* New build to resolve CVE-2023-0802/CVE-2023-0796/CVE-2023-0803/CVE-2023-0799/CVE-2023-0800/CVE-2023-0801/CVE-2023-0798/CVE-2023-0795/CVE-2023-0797/CVE-2023-0804/USN-5923-1

**2023-02-28**
* New build to resolve CVE-2023-23914/CVE-2023-23915/CVE-2023-23916/USN-5891-1
* FFmpeg has been provided to allow transcoding

**2023-02-23**
* Moving away from youtube-dl to yt-dlp following https://github.com/ytdl-org/youtube-dl/issues/31530
* FFmpeg is not provided yet
* This may break your config, ajust /var/snap/podcast-dl-gael/common/podcast-dl/youtube-dl.conf.d/youtube-dl.conf accordingly

**2023-02-09**
* New build to resolve CVE-2022-45142/USN-5849-1

**2023-01-13**
* New build to resolve CVE-2021-44758/CVE-2022-3437/CVE-2022-42898/CVE-2022-44640/USN-5800-1

**2023-01-06**
* New build to resolve CVE-2022-43552/USN-5788-1

**2022-12-08**
* New build to resolve CVE-2022-41916/USN-5766-1

**2022-10-27**
* New build to resolve CVE-2022-32221/USN-5702-1

**2022-10-14**
* New build to resolve CVE-2021-3671/CVE-2022-3116/USN-5675-1

**2022-09-02**
* New build to resolve CVE-2022-35252/USN-5587-1

**2022-06-28**
* New build to resolve CVE-2022-32205/CVE-2022-32206/CVE-2022-32207/CVE-2022-32208/USN-5495-1

**2022-05-18**
* New build to resolve CVE-2022-29155/USN-5424-1

**2022-05-12**
* New build to resolve CVE-2022-27780/CVE-2022-27781/CVE-2022-27782/USN-5412-1

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

