#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm libdecor

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

echo "Getting app..."
echo "---------------------------------------------------------------"
mkdir -p ./AppDir/bin
wget https://zsnes.com/files/SuperZSNES_v0.230.tar.gz
tar -xvf SuperZSNES*.tar.gz -C ./AppDir/bin
rm -f ./*.tar.gz ./AppDir/bin/libdecor*.so*
mv -v ./AppDir/bin/UnityPlayer.so /usr/lib
