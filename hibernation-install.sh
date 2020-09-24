#!/bin/bash

# I'm too lazy to add comments to this one
sudo cp hibernation-service-script.sh /usr/bin/local/hibernation.sh
sudo chmod a+x /usr/bin/local/hibernation.sh
sudo cp hibernation.service /etc/systemd/system/hibernation.service
sudo systemctl daemon-reload && sudo systemctl enable hibernation.service && sudo systemctl start hibernation.service
