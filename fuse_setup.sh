#!/bin/bash

watchman shutdown-server
echo 100000 > /proc/sys/fs/inotify/max_user_watches

sed -i 's/"c:[^"]*"/"init_time"/g' ~/dotfiles/bs-build-part.json
umount ~/mergeBS
rm -fr ~/bs-build-part ~/tmp
cd ~

git clone git@192.168.81.7:bs-build-part/bs-build-part.git
mkdir -p ~/mergeBS ~/tmp
# lower=read-only dir , upper=rw dir
mount -t overlay overlay -olowerdir=/root/NewRepo,upperdir=/root/bs-build-part,workdir=/root/tmp /root/mergeBS
watchman watch ~/bs-build-part

# get the repository created time
INIT_TIME=$(watchman clock /root/bs-build-part/ | jq -M .clock)
sed -i 's/"init_time"/'${INIT_TIME}'/g' ~/dotfiles/bs-build-part.json
