#!/bin/bash

# watchman shutdown-server
# echo 100000 > /proc/sys/fs/inotify/max_user_watches

# sed -i 's/"c:[^"]*"/"init_time"/g' ~/dotfiles/bs-build-part.json

umount ~/nasx86_4-2-0-x86_64_bs
rm -fr ~/tmp ~/nasx86_4-2-0-x86_64_bs
cd ~

#sudo chown ${USER} .ssh
mkdir -p ~/tmp
git clone git@192.168.81.7:nasx86_4-2-0-x86_64_bs/nasx86_4-2-0-x86_64_bs.git
# lower=read-only dir , upper=rw dir
mount -t overlay overlay -olowerdir=/root/NasX86_4.2.0,upperdir=/root/nasx86_4-2-0-x86_64_bs,workdir=${HOME}/tmp /root/nasx86_4-2-0-x86_64_bs
# watchman watch ~/bs-build-part

# get the repository created time
# INIT_TIME=$(watchman clock ${HOME}/bs-build-part/ | jq -M .clock)
# sed -i 's/"init_time"/'${INIT_TIME}'/g' ~/dotfiles/bs-build-part.json
