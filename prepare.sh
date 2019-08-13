#!/bin/bash

## VARIABLES
HOWMANY_CORES=$(cat /proc/cpuinfo | grep processor | wc -l)
PYTHON_VERSION=3.7.4
USER=$(whoami)

## ALERTS
echo "You will be prompted to type your user's password, if you have one."

## UPDATE APT REPO
echo "Initializing APT REPO UPDATE."
sudo apt update
echo "Done!"
echo "Initializing APT REPO UPGRADE."
sudo apt upgrade -y
echo "Done!"

## ESSENTIALS
## Comment a line if you don't want that specific package
echo "Installing essential packages"
sudo apt install \
    bmon \
    build-essentials \
    checkinstall \
    curl \
    exfat-fuse \
    exfat-utils \
    ffmpeg \
    fonts-powerline \
    git \
    gnome-tweak-tool \
    gparted \
    guake \
    hping3 \
    htop \
    iftop \
    mosh \
    nmap \
    ntfs-3g \
    openssh-client \
    openssh-server \
    powerline \
    tilix \
    vim \
    wget \
    xz-utils
echo "Packages Installed"
echo "Done!"

## SSH key
echo "Creating a ssh-key"
mkdir ~/.ssh
cd ~/.ssh
ssh-keygen -C "$(USER)-personal-key" -t ed25519 -a 100
echo "ssh-key created..."
echo "Done!"

## PYTHON
echo "Installing Python ${PYTHON_VERSION}"
## Dependencies
echo "Installing dependencies first:"
sudo apt install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev uuid-dev lzma-dev libffi-dev
echo "Dependencies installed"
## Download
echo "Downloading Python"
cd ~/Downloads
wget https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz
echo "Done!"
echo "Initiating installation"
tar xvf Python-${PYTHON_VERSION}.tgz
cd Python-${PYTHON_VERSION}
./configure --prefix=/usr/local/lib/python3.7 --enable-optimizations
make -j${HOWMANY_CORES}
sudo make install
rm -rf ~/Downloads/Python${PYTHON_VERSION}*
echo "Installed! DOOOONE! finally..."

# Choosing the default terminal emulator (#TeamTilix!)
echo "Now, you will choose the defualt terminal emulator"
sudo update-alternatives --config x-terminal-emulator
echo "Done choosing!"

