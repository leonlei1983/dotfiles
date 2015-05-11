#!/bin/bash

# watchman shutdown-server
# echo 100000 > /proc/sys/fs/inotify/max_user_watches

# sed -i 's/"c:[^"]*"/"init_time"/g' ~/dotfiles/bs-build-part.json
sudo umount ~/mergeBS
sudo rm -fr ~/mergeBS ~/tmp
cd ~

sudo chown ${USER} .ssh
mkdir -p ~/mergeBS ~/tmp
# lower=read-only dir , upper=rw dir
sudo mount -t overlay overlay -olowerdir=/home/yihu/NasX86_4.2.0,upperdir=${HOME}/mergeBS,workdir=${HOME}/tmp ${HOME}/mergeBS
# watchman watch ~/bs-build-part

# get the repository created time
# INIT_TIME=$(watchman clock ${HOME}/bs-build-part/ | jq -M .clock)
# sed -i 's/"init_time"/'${INIT_TIME}'/g' ~/dotfiles/bs-build-part.json
