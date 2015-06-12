#!/bin/bash

umount ~/nasx86_4-2-0-x86_64_bs
umount /mnt/pub
rm -fr ~/tmp ~/nasx86_4-2-0-x86_64_bs /mnt/pub
cd ~

mkdir -p ~/tmp /mnt/pub /opt/cross-project/x86/sys-root/bin
ln -sf /usr/bin/openssl /opt/cross-project/x86/sys-root/bin/openssl
git clone git@192.168.81.7:nasx86_4-2-0-x86_64_bs/nasx86_4-2-0-x86_64_bs.git
# lower=read-only dir , upper=rw dir
mount -t overlay overlay -olowerdir=/root/NasX86,upperdir=/root/nasx86_4-2-0-x86_64_bs,workdir=${HOME}/tmp /root/nasx86_4-2-0-x86_64_bs
mount.nfs -o nolock 172.17.21.5:/pub /mnt/pub
