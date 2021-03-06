#!/bin/bash

# Some color functions from John Hammond's script
RED=`tput bold && tput setaf 1`
GREEN=`tput bold && tput setaf 2`
YELLOW=`tput bold && tput setaf 3`
BLUE=`tput bold && tput setaf 4`
NC=`tput sgr0`

function RED(){
	echo -e "\n${RED}${1}${NC}"
}
function GREEN(){
	echo -e "\n${GREEN}${1}${NC}"
}
function YELLOW(){
	echo -e "\n${YELLOW}${1}${NC}"
}
function BLUE(){
	echo -e "\n${BLUE}${1}${NC}"
}

# If you're not root then kill the script
if [ $UID -ne 0 ]
then
	RED "You must run this script WITH SUDO, NOT AS THE ROOT USER!" && echo
	exit
fi

# Create workspace directory
mkdir ~/Workspace
# Remove the dirs that linux creates
rmdir ~/Desktop ~/Music ~/Pictures ~/Public ~/Templates ~/Videos
# Install dependencies
sudo apt update
sudo apt install -y git python3.8 python3-pip3 wget make gcc linux-headers-generic default-jdk default-jre build-essential cmake terminator nmap libxcb-xtest0
# Install Google Chrome
wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" -O chrome.deb
sudo dpkg -i chrome.deb
# Install zoom
wget "https://zoom.us/client/latest/zoom_amd64.deb" -O zoom.deb
sudo dpkg -i zoom.deb
# Install atom
wget "https://atom.io/download/deb" -O atom.deb
sudo dpkg -i atom.deb
# Install and setup conda
wget "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh" -O miniconda.sh | bash
# wget "https://repo.anaconda.com/archive/Anaconda3-2020.07-Linux-x86_64.sh" -O anaconda.sh # Uncomment if you want full anaconda
conda create -n my_conda python=3
source activate my_conda
conda install ipykernel
python -m ipykernel install
rm miniconda.sh
# Python modules
python3 -m pip install 'python-language-server[all]' black discord.py[voice]>=1.4.1 asyncio~=3.4.3 datetime>=4.3 pillow<=7.2.0 cogs bs4 pymongo>=3.11.0 motor>=2.2.0 googletrans>=3.0.0 aiohttp TextToOwO>=2.0.1 urbandict>=0.6.1 e>=1.4.5 youtube_dl tweepy asteval dnspython>=2.0.0 PyNaCl>=1.4.0
# rm anaconda.sh # Uncomment if you are installing full anaconda
# Optional: Set terminator as the default terminal emulator
# sed -i s/Exec=gnome-terminal/Exec=terminator/g /usr/share/applications/gnome-terminal.desktop

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install -y apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install -y sublime-text
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
# Install nmap so rustscan can work
cd ~/Downloads
wget "https://nmap.org/dist/nmap-7.80.tar.bz2"
bzip2 -cd nmap-7.80.tar.bz2 | tar xvf -
cd nmap-7.80/
./configure
make
sudo make install
# More dependencies
brew install gcc
brew install rustscan
# Extras
grep "export PS1" ~/.bashrc
if [ $? -eq 1 ]
then
	echo "export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> ~/.bashrc
fi
echo "" | sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder
sudo apt-get update
sudo apt-get install -y simplescreenrecorder
sudo apt-get install -y docker.io
sudo groupadd docker
sudo usermod -aG docker `logname`
sudo apt-get install -y pinta
sudo apt-get install -y exiftool
sudo apt-get install -y python-pil
sudo apt-get install -y sqlitebrowser
sudo apt-get install -y wireshark
wget "https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-6.17.1113-Linux-x64.deb" -O vnc_viewer.deb
sudo dpkg -i vnc_viewer.deb
sudo apt install -y xclip
grep "alias xclip" ~/.bashrc
if [ $? -eq 1 ]
then
	echo "alias xclip='xclip -selection clipboard'" >> ~/.bashrc
fi
# Basic pentesting tools
sudo pip3 install flask
sudo pip3 install flask-login
sudo pip3 install colorama
sudo pip3 install passlib
sudo snap install spotify
sudo apt install -y binwalk
sudo apt install -y tesseract-ocr
sudo apt install -y foremost
sudo apt install -y bsdgames
sudo apt install -y hexedit
sudo pip3 install pwntools
sudo apt install -y golang-go
BLUE "Adding GOPATH and GOBIN to .bashrc, so future installs are easy.."
grep "export GOPATH" ~/.bashrc
if [ $? -eq 1 ]
then
	echo "export GOPATH=\$HOME/.go/" >> ~/.bashrc
fi
grep "export GOBIN" ~/.bashrc
if [ $? -eq 1 ]
then
	echo "export GOBIN=\$HOME/.go/bin" >> ~/.bashrc
	echo "export PATH=\$PATH:\$GOBIN" >> ~/.bashrc
fi
sudo apt install -y sqlite
sudo apt install -y nikto
sudo apt install -y zbar-tools
sudo apt install -y qrencode
sudo apt install -y pdfcrack
sudo apt install -y virtualbox-qt
sudo apt install -y vagrant
wget "https://d2ap6ypl1xbe4k.cloudfront.net/Hopper-v4-4.3.14-Linux.deb"
sudo dpkg -i Hopper-v4-4.3.14-Linux.deb
echo "" | sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java8-installer
wget "http://www.caesum.com/handbook/Stegsolve.jar" -O "stegsolve.jar"
chmod +x "stegsolve.jar"
sudo apt install -y fcrackzip
sudo apt install -y unrar
sudo apt install -y steghide
sudo apt install -y ffmpeg
sudo pip3 install netifaces
sudo pip3 install iptools
sudo pip3 install pyopenssl
sudo pip3 install pydispatch
sudo apt install -y gimp
sudo apt install -y cmake
sudo apt install -y mplayer
sudo apt install -y sshpass
sudo apt install -y tcpflow
sudo pip3 install scapy
sudo apt install libcompress-raw-lzma-perl
sudo apt install libcompress-raw-lzma-perl
# Grab the flutter sdk
sudo snap install flutter --classic
rm *.deb

echo "Please run the bluetooth, audio, and hibernation install scripts if on mac, then restart the machine."
