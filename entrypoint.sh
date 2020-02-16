#!/bin/sh
set -e

sudo chown -R makepkg /build /github/workspace

cd /build

gpg --recv-keys FD6C57F9

git clone --depth 1 "https://aur.archlinux.org/freenet.git" .
sed -i "s|'java-service-wrapper'||" PKGBUILD

PKGDEST="/github/workspace" \
    makepkg -si --noconfirm
