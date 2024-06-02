#!/bin/bash -e

if [ "$BBN_KIND" == "LITE" ] ; then
  exit 0
fi

#apt-get install -y jellyfin

xargs -n 1 -P 4 wget -q << EOF
https://repo.jellyfin.org/files/server/debian/latest-stable/arm64/jellyfin-server_10.9.4%2Bdeb12_arm64.deb
https://repo.jellyfin.org/files/server/debian/latest-stable/arm64/jellyfin_10.9.4%2Bdeb12_all.deb
https://repo.jellyfin.org/files/server/debian/latest-stable/arm64/jellyfin-web_10.9.4%2Bdeb11_all.deb
https://repo.jellyfin.org/releases/server/debian/versions/jellyfin-ffmpeg/6.0.1-3/jellyfin-ffmpeg6_6.0.1-3-bookworm_arm64.deb
EOF

dpkg -i jellyfin*.deb
rm -rf jellyfin*.deb

adduser jellyfin audio

systemctl disable jellyfin
