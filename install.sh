#!/bin/bash

######Variables#####
s="sudo"
il="sudo xbps-install -y"
#####################
clear

echo "|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|"
echo "| VoidBSP Installer |"
echo "|___________________|"
echo ""
echo ""
sleep 2s
echo "Introduzca contraseña para continuar"
sudo -k
if sudo true; then
	clear
	echo "Iniciando Instalación..."
	sleep 2s
else
	clear
	echo "Debe introduccir contraseña para continuar"
	exit 1
fi

#UPDATE REPO
$s xbps-install -Sy

#REPOS NON-FREE Y MULTILIB(32bit)
$il void-repo-{nonfree,multilib,multilib-nonfree}
$s xbps-install -Sy

#ESENCIALES
$il at-spi2-core p7zip xorg-minimal xorg-fonts xorg-video-drivers xsetroot gvfs ntfs-3g curl wget 

#NVIDIA
$il nvidia nvidia-libs-32bit

#PARA COMPILAR(OPCIONAL)
$il base-devel

#BASE
$il i3-gaps i3status xsetroot xdo setxkbmap \
	dbus kitty elogind feh pcmanfm

#AUDIO 
$il pulsemixer wireplumber pipewire rtkit pfetch lxappearance mpv arandr neovim 

#OTROS
$il pfetch lxappearance mpv arandr neovim keepassxc android-tools leafpad zathura dunst libnotify ripgrep python3-virtualenv flameshot

#FONTS
$il noto-fonts-cjk noto-fonts-emoji noto-fonts-ttf noto-fonts-ttf-extra	

#LIBS PARA JUEGOS(OPCIONAL)
#$il libgcc-32bit libstdc++-32bit libdrm-32bit libglvnd-32bit freetype-32bit vulkan-loader-32bit

#FONT FIX
$s ln -s /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/
$s xbps-reconfigure -f fontconfig

clear
echo "Aplicando configuraciones..."
sleep 2s


#INICIAR SERVICIOS
$s ln -s /etc/sv/dbus /var/service/
$s rm -r /var/service/polkitd

#CONFIG
#xdg-user-dirs-update

echo -e '#autostart
\nif [ -d "$HOME/.local/bin" ] ; then
\n    PATH="$HOME/.local/bin:$PATH"
\nfi
\npipewire &
\nexec dbus-run-session i3'> $HOME/.xinitrc 

#PIPEWIRE_CONFIG
$s mkdir -p /etc/pipewire/pipewire.conf.d
$s ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
$s ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d/

###
clear
echo "Instalación de VoidBsp-term Completada"
echo "Pulse cualquiera tecla para continuar..."
read tecla
clear
$s reboot
