#!/bin/bash

watchman watch-del ~/bs-build-part
sed -i 's/"c[^"]*"/"init_time"/g' ~/dotfiles/bs-build-part.json
fusermount -u ~/mergeBS
rm -fr ~/bs-build-part
cd ~

git clone git@192.168.81.7:bs-build-part/bs-build-part.git
mkdir -p ~/mergeBS
unionfs-fuse -o cow /root/bs-build-part=RW:/root/NewRepo=RO /root/mergeBS
watchman watch ~/bs-build-part

# get the repository created time
INIT_TIME=$(watchman clock /root/bs-build-part/ | jq -M .clock)
sed -i 's/"init_time"/'${INIT_TIME}'/g' ~/dotfiles/bs-build-part.json
