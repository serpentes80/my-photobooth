#!/bin/sh
#script to build and install Nextcloud client on RPi

sudo apt-get install build-essential git cmake openssl libssl-dev sqlite3 libsqlite3-dev qt5-default libqt5webkit5-dev qttools5-dev qttools5-dev-tools python-sphinx texlive-latex-base inotify-tools qt5keychain-dev -y
sudo apt-get install doxygen -y
sudo apt-get install extra-cmake-modules -y
sudo apt-get install kio-dev -y
cd /home/pi
git clone https://github.com/nextcloud/client_theming.git
cd client_theming
git submodule update --init
cd client
git submodule update --init
cd ..
mkdir build-1
cd build-1
cmake -D OEM_THEME_DIR=`pwd`/../nextcloudtheme ../client
sed -i 's/Icon=nextcloud/Icon=Nextcloud/g' src/gui/nextcloud.desktop
sed -i 's/Icon\[\(.*\)\]=nextcloud/Icon\[\1\]=Nextcloud/g' src/gui/nextcloud.desktop
make
sudo make install
