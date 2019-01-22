# personal-overlay
My personal Gentoo overlay. I work on ebuilds I need here. Use on own risk. Think might be broken once in a while.

## How to use
If you want to use this overlay, copy this text into a new file in ```/etc/portage/repos.conf/```

```
[personal-overlay]
location = /usr/local/overlay/personal-overlay
sync-type = git
sync-uri = https://github.com/janhenke/personal-overlay
auto-sync = yes
```
