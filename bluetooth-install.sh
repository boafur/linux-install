#!/bin/bash

cd ~/Downloads
git clone https://github.com/leifliddy/macbook12-bluetooth-driver.git
cd macbook12-bluetooth-driver/
sudo ./install.bluetooth.driver.sh
echo "Please restart for the changes to take effect"
