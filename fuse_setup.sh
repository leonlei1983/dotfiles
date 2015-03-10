#!/bin/bash

# watchman watch-del ~/bs-build-part
fusermount -u ~/mergeBS
rm -fr ~/bs-build-part
cd ~

git clone git@192.168.81.7:bs-build-part/bs-build-part.git
mkdir -p ~/mergeBS
unionfs-fuse -o cow /root/bs-build-part=RW:/root/NewRepo=RO /root/mergeBS
# watchman watch ~/bs-build-part

# get the current time
# INIT_TIME=$(watchman clock /root/bs-build-part/ | jq -M .clock)
# sed -i 's/"n:tmp"/'${INIT_TIME}'/g' ~/dotfiles/bs-build-part.json
