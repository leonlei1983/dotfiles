#!/bin/bash

umount ~/nasx86_4-2-0-x86_64_bs
rm -fr ~/tmp ~/nasx86_4-2-0-x86_64_bs
cd ~

mkdir -p ~/tmp
git clone git@192.168.81.7:nasx86_4-2-0-x86_64_bs/nasx86_4-2-0-x86_64_bs.git
# lower=read-only dir , upper=rw dir
mount -t overlay overlay -olowerdir=/root/NasX86_4.2.0,upperdir=/root/nasx86_4-2-0-x86_64_bs,workdir=${HOME}/tmp /root/nasx86_4-2-0-x86_64_bs
