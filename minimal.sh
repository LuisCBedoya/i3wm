#!/bin/bash

i="sudo apt install -y"
i1="sudo apt install --no-install-recommends -y"
s="sudo"


echo "|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|"
echo "|Workpace Installer|"
echo "|__________________|"
echo ""
echo ""
sleep 2s
echo "Introduzca contraseña para continuar"
sudo -k
if sudo true; then
	clear
	echo "Iniciando Instalacion..."
	sleep 2s
else
	clear
	echo "Debe introduccir contraseña para continuar"
	exit 1
fi

# paquetes xorg
$i xorg xbacklight xbindkeys xinput xorg-dev

# $i amd64-microcode
$i intel-microcode

#Paquetes para compilar
$i linux-headers-amd64 build-essential make automake pkg-config cmake autoconf git curl wget unzip tar gzip libglvnd-dev python3-pip python3.11-venv

# Network File Tools/System Events
$i dialog mtools dosfstools avahi-daemon acpi acpid gvfs-backends network-manager

#enable services
sudo systemctl enable avahi-daemon
sudo systemctl enable acpid 

#codecs
$i pulseaudio alsa-utils pavucontrol alsa-firmware-loaders alsa-oss alsa-tools alsamixergui volumeicon-alsa pacman paprefs pavumeter pulseaudio-utils
$i lame libdvdnav4 libfaac0 libmad0 libmp3lame0 libquicktime2 libstdc++5 libxvidcore4 twolame vorbis-tools x264
$i gstreamer1.0-x gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-alsa gstreamer1.0-pulseaudio gstreamer1.0-tools

# fuentes browser
$i fonts-noto fonts-noto-cjk fonts-noto-extra fonts-noto-color-emoji

#UserPackages
$i1 alacritty feh lxappearance thunar lxpolkit ripgrep dunst libnotify-bin flameshot htop zathura vlc nvtop gpicview

#xinitrc
echo -e '#autostart
\nif [ -d "$HOME/.local/bin" ] ; then
\n    PATH="$HOME/.local/bin:$PATH"
\nfi
\nsetxkbmap latam &
\nexec dbus-run-session i3'> $HOME/.xinitrc

#reboot
clear
echo "Instalación de VoidBsp-term Completada"
echo "Pulse cualquiera tecla para continuar..."
read tecla
clear
$s reboot
