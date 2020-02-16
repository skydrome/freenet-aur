#!/bin/sh
set -e

sudo chown -R makepkg /build /github/workspace /github/home /home/makepkg
mkdir -p /home/makepkg/.config
touch /home/makepkg/.jgitconfig

cd /build

git clone --depth 1 "https://aur.archlinux.org/freenet.git" .
sed -i "s|'java-service-wrapper'||" PKGBUILD

gpg --recv-keys FD6C57F9
PKGDEST="/github/workspace" \
    makepkg -si --noconfirm
