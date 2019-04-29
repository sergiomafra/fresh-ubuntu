#!/bin/bash

## VARIABLES
HOWMANY_CORES=$(cat /proc/cpuinfo | grep processor | wc -l)

## ALERTS
echo "You will be prompted your user password, if you have one."

## UPDATE APT REPO
echo "Initializing APT REPO UPDATE."
sudo apt update
echo "Done!"
echo "Initializing APT REPO UPGRADE."
sudo apt upgrade -y
echo "Done!"

## ESSENTIALS
## Comment a line if don't want that specific package
sudo apt install \
    bmon \
    build-essentials \
    checkinstall \
    curl \
    exfat-fuse \
    exfat-utils \
    ffmpeg \
    git \
    gparted \
    hping3 \
    htop \
    iftop \
    mosh \
    nmap \
    ntfs-3g \
    openssh-server \
    vim \
    wget \
    xz-utils

## PYTHON 3.7.2
## Dependencies
sudo apt install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev uuid-dev lzma-dev libffi-dev
## Download
cd ~/Downloads
wget https://www.python.org/ftp/python/3.7.2/Python-3.7.2.tgz
tar xvf Python-3.7.2.tgz
cd Python-3.7.2
./configure --prefix=/usr/local/lib/python3.7 --enable-optimizations
make -j${HOWMANY_CORES}
sudo make install
rm -rf ~/Downloads/Python3.7.2*
