#!/bin/bash

clear

echo "The script to install Cloud9 on this system starts now"
echo "This will install node and update and upgrade apt-get"
echo "This may break a few things"
echo "Here it goes."

cd ~

sudo apt-get update -y && sudo apt-get upgrade -y

echo "Install latest NodeJS"
wget http://node-arm.herokuapp.com/node_latest_armhf.deb 
sudo dpkg -i node_latest_armhf.deb

export NODE_PATH=”/usr/local/lib/node_modules”

echo "Now getting the latest Cloud9 SDK"

git clone git://github.com/c9/core.git c9sdk

cd c9sdk

scripts/install-sdk.sh

echo "And now the magic begins"
echo "------------------------"
su pi -c 'node /home/pi/c9sdk/server.js -l 0.0.0.0 -a : -w ~ < /dev/null &'

./server.js -l 0.0.0.0 -a : -w ~

