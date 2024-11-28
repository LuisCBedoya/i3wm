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
$i pulseaudio pulseaudio-utils

#UserPackages
$i1 alacritty feh lxappearance thunar lxpolkit ripgrep dunst libnotify-bin flameshot htop zathura vlc nvtop gpicview

#xinitrc
echo -e '#autostart
\nexport XDG_SESSION_TYPE=x11
\nexport GDK_BACKEND=x11
\nsetxkbmap latam &
\npipewire &
\nexec dbus-run-session i3'> $HOME/.xinitrc

#reboot
clear
echo "Instalación de VoidBsp-term Completada"
echo "Pulse cualquiera tecla para continuar..."
read tecla
clear
$s reboot
