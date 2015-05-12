#!/bin/bash

# watchman shutdown-server
# echo 100000 > /proc/sys/fs/inotify/max_user_watches

# sed -i 's/"c:[^"]*"/"init_time"/g' ~/dotfiles/bs-build-part.json
RUN sed -i 's/David Hu/Wayne Chou/g' dotfiles/gitconfig &&\
    sed -i 's/chin33z@gmail.com/waynechou@qnap.com/g' dotfiles/gitconfig

umount ~/mergeBS
rm -fr ~/mergeBS ~/tmp
cd ~

#sudo chown ${USER} .ssh
mkdir -p ~/mergeBS ~/tmp
# lower=read-only dir , upper=rw dir
mount -t overlay overlay -olowerdir=/root/NasX86_4.2.0,upperdir=${HOME}/mergeBS,workdir=${HOME}/tmp ${HOME}/mergeBS
cd mergeBS
git pull
# watchman watch ~/bs-build-part

# get the repository created time
# INIT_TIME=$(watchman clock ${HOME}/bs-build-part/ | jq -M .clock)
# sed -i 's/"init_time"/'${INIT_TIME}'/g' ~/dotfiles/bs-build-part.json
