#!/bin/bash

watchman shutdown-server
#echo 100000 > /proc/sys/fs/inotify/max_user_watches

sed -i 's/"c:[^"]*"/"init_time"/g' ~/dotfiles/bs-build-part.json
sudo umount ~/mergeBS
sudo rm -fr ~/bs-build-part ~/tmp
cd ~

sudo chown ${USER} .ssh
git clone git@192.168.81.7:bs-build-part/bs-build-part.git
mkdir -p ~/mergeBS ~/tmp
# lower=read-only dir , upper=rw dir
sudo mount -t overlay overlay -olowerdir=/root/NewRepo,upperdir=${HOME}/bs-build-part,workdir=${HOME}/tmp ${HOME}/mergeBS
watchman watch ~/bs-build-part

# get the repository created time
INIT_TIME=$(watchman clock ${HOME}/bs-build-part/ | jq -M .clock)
sed -i 's/"init_time"/'${INIT_TIME}'/g' ~/dotfiles/bs-build-part.json
