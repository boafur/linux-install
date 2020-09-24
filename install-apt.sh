#!/bin/bash

# Create workspace directory
mkdir ~/Workspace
# Install dependencies
sudo apt install -y git python3.8 atom sublime-text wget make gcc linux-headers-generic default-jdk default-jre build-essential cmake
# Install sdkman
curl -s "https://get.sdkman.io" | bash
# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
# Initialize homebrew
echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> $HOME/.profile
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
# Setup sdkman and jdks
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 15.0.0.hs-adpt
sdk install java 11.0.8.hs-adpt
sdk install java 8.0.265.hs-adpt
# More dependencies
brew install gcc
brew install rustscan

echo "Please run the bluetooth, audio, and hibernation install scripts if on mac, then restart the machine."
