#!/usr/bin/env bash

## configure and install minimal xfce desktop environment

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo "Este script debe ejecutarse con sudo, inténtalo de nuevo..."
  exit 1
fi

apt install --no-install-recommends --no-install-suggests -y \
    libxfce4ui-utils \
    xfce4-panel \
    xfce4-pulseaudio-plugin \
    xfce4-notifyd \
    xfce4-power-manager \
    xfce4-whiskermenu-plugin \
    xfce4-session \
    xfce4-settings \
    xfconf \
    xfdesktop4 \
    xfwm4 \
    xinit \
    qt5ct

apt install --no-install-recommends --no-install-suggests -y linux-headers-$(uname -r) build-essential make automake pkg-config cmake autoconf git libglvnd-dev
apt install --no-install-recommends --no-install-suggests -y intel-microcode
apt install --no-install-recommends --no-install-suggests -y alacritty

echo -e '#autostart
\nif [ -d "$HOME/.local/bin" ] ; then
\n    PATH="$HOME/.local/bin:$PATH"
\nfi
\npipewire &
\nsetxkbmap latam &
\nexec dbus-run-session startxfce4'> $HOME/.xinitrc

echo
echo Instalación de xfce completa, reinicie y emita 'startx'
echo
