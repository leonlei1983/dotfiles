#!/bin/bash

watchman shutdown-server
echo 100000 > /proc/sys/fs/inotify/max_user_watches

sed -i 's/"c:[^"]*"/"init_time"/g' ~/dotfiles/bs-build-part.json
# fusermount -u ~/mergeBS
umount /root/mergeBS
rm -fr ~/bs-build-part ~/tmp
cd ~

git clone git@192.168.81.7:bs-build-part/bs-build-part.git
mkdir -p ~/mergeBS ~/tmp
# overlayfs cannot overlay the dir mount from outside container, so we copy the dir to local
if [ ! -d "NewRepo2" ]; then
    cp -r NewRepo/ NewRepo2
fi
# unionfs-fuse -o cow /root/bs-build-part=RW:/root/NewRepo=RO /root/mergeBS
mount -t overlay overlay -olowerdir=/root/NewRepo2,upperdir=/root/bs-build-part,workdir=/root/tmp /root/mergeBS
watchman watch ~/bs-build-part

# get the repository created time
INIT_TIME=$(watchman clock /root/bs-build-part/ | jq -M .clock)
sed -i 's/"init_time"/'${INIT_TIME}'/g' ~/dotfiles/bs-build-part.json
