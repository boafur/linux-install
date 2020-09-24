#!/bin/bash

cd ~/Downloads
git clone https://github.com/davidjo/snd_hda_macbookpro.git
cd snd_hda_macbookpro/
sudo ./install.cirrus.driver.sh
echo "Please reboot for these changes to take effect"
