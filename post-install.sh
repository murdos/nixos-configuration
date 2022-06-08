#!/usr/bin/env bash

INSTALL_ROOT="/mnt"
USER=amino
CONFIG_PATH="$INSTALL_ROOT/home/$USER/.config"
GITHUB_HTTP="http://github.com/murdos"

clone() {
git clone $GITHUB_HTTP/$1 $CONFIG_PATH/$2
cd $CONFIG_PATH/$2
cd -
}

mkdir -p $CONFIG_PATH
clone nixos-home-configuration nixpkgs
clone omf-config omf
chown --reference=/mnt/home/$USER -R /mnt/home/$USER

mount -o bind,ro /etc/resolv.conf $INSTALL_ROOT/etc/resolv.conf
nixos-enter --root $INSTALL_ROOT -c 'sudo -u $USER "home-manager switch"'
