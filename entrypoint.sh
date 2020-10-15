#!/bin/sh
set -e

sudo chown -R makepkg /build /github/workspace /github/home /home
mkdir -p /home/makepkg/.config
touch /home/makepkg/.jgitconfig

cd /build

git clone --depth 1 "https://aur.archlinux.org/freenet.git" .
sed -i "s|'java-service-wrapper'||" PKGBUILD

curl -s https://freenetproject.org/assets/keyring.gpg |gpg --import -
PKGDEST="/github/workspace" \
    makepkg -si --noconfirm
