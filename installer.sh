#!/bin/bash

i="sudo apt install -y"
i1="sudo apt install --no-install-recommends --no-install-suggests -y"
s="sudo"

echo "El script requiere de repositorios non-free"
sleep 2s
echo "¿Deseas habilitar los repositorios 'non-free' en tu sistema? (y/n)"
read respuesta

if [ "$respuesta" = "sí" ] || [ "$respuesta" = "si" ] || [ "$respuesta" = "y" ]; then
  echo "Agregando los repositorios 'non-free' a /etc/apt/sources.list..."
  
  $s cp /etc/apt/sources.list /etc/apt/sources.list.bak
  $s rm /etc/apt/sources.list

  cat <<EOF | $s tee /etc/apt/sources.list
deb http://deb.debian.org/debian $(lsb_release -sc) main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian $(lsb_release -sc) main contrib non-free non-free-firmware

deb http://deb.debian.org/debian-security $(lsb_release -sc)-security main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian-security $(lsb_release -sc)-security main contrib non-free non-free-firmware

deb http://deb.debian.org/debian $(lsb_release -sc)-updates main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian $(lsb_release -sc)-updates main contrib non-free non-free-firmware
EOF

  echo ""
  echo "|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|"
  echo "| Repositorios 'non-free' agregados con éxito.|"
  echo "|_____________________________________________|"
  sleep 2s
  echo ""
else
  echo "|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|"
  echo "| No se agregarán repositorios 'non-free'    .|"
  echo "|_____________________________________________|"
  sleep 2s
  echo ""
fi

echo "|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|"
echo "|    Actualizando      |"
echo "|______________________|"
echo "Actualizando la lista de paquetes e instalando actualizaciones..."
echo ""
$s apt update && $s apt upgrade -y
echo ""
echo "Actualización completada."
echo ""
sleep 2s

#### Xorg Packages
$i xserver-xorg-core xserver-xorg-input-evdev x11-xserver-utils x11-xkb-utils x11-utils xinit xbacklight

### intel packages
$i xserver-xorg-video-intel intel-microcode mesa-vulkan-drivers
# $i amd64-microcode 
#intel-gpu-tools

#### Nvidia Packages
$i nvidia-driver

#### Audio
$i pulseaudio pulseaudio-utils alsa-utils

#### Energy
$i power-profiles-daemon upower

#### Network
#$i dnsmasq dnsutils ethtool network-manager wpasupplicant

#### base packages
$i dmidecode dmraid hdparm open-iscsi mtools avahi-daemon acpi acpid sg3-utils firmware-sof-signed dosfstools dialog efitools nfs-common nilfs-tools ffmpegthumbnailer libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi gstreamer1.0-plugins-bad xdg-utils linux-headers-amd64 build-essential pkg-config 

### Tools
$i libglvnd-dev dunst libnotify-bin git curl wget inxi htop nvtop unrar rar tar unzip xz-utils bash-completion

### Fonts 
#$i ttf-mscorefonts-installer

#### Firewall
#$i ufw
#$s ufw enable

#### User Packages
$i1 lxappearance thunar lxpolkit flameshot zathura gpicview vlc ripgrep

#### Enable Services
$s systemctl enable avahi-daemon
$s systemctl enable acpid

#### Config AutoStart
echo -e '#autostart
\nexport XDG_SESSION_TYPE=x11
\nexport GDK_BACKEND=x11
\nsetxkbmap latam &
\nexec dbus-run-session dwm'> $HOME/.xinitrc

clear
echo "Instalación de ArtixWorspace Completada"
echo "Pulse cualquiera tecla para continuar..."
read tecla
clear
$s reboot

