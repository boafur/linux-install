#!/bin/bash

cd /tmp
git clone https://github.com/p2rkw/xf86-input-mtrack.git
cd xf86-input-mtrack
./configure --with-xorg-module-dir=/usr/lib/xorg/modules
sudo make
sudo make install
cd ../
sudo touch /usr/share/X11/xorg.conf.d/50-mtrack.conf
sudo cat ./config.txt > /usr/share/X11/xorg.conf.d/50-mtrack.conf
echo "Please restart"
echo "If the trackpad fails to initialize then add yourself to the input group by executing `./input-group.sh` if on arch based system please run `./input-group-arch.sh`"
