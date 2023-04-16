#!/bin/bash

i="sudo apt install -y"
i1="sudo apt install --no-install-recommends -y"

# paquetes xorg ------------------------------------------------------------- 
$i xorg xbacklight xbindkeys xinput xorg-dev

# $i amd64-microcode ----------------------------------------------------------------------
$i intel-microcode

#nvidia driver -------------------------------------------------------------------------------
$i nvidia-driver

#Paquetes para compilar ---------------------------------------------------------------------------------
$i linux-headers-$(uname -r) build-essential make automake pkg-config cmake autoconf git curl wget unzip tar gzip python3-pip 

# Network File Tools/System Events ----------------------------------------------------------------------------------
$i dialog mtools dosfstools avahi-daemon acpi acpid gvfs-backends

#enable services
sudo systemctl enable avahi-daemon
sudo systemctl enable acpid

# paquetes de sonido  -----------------------------------------------------------------------------------------------------
$i pulseaudio alsa-utils pavucontrol alsa-firmware-loaders alsa-oss alsa-tools alsamixergui volumeicon-alsa pacman paprefs pavumeter pulseaudio-utils ffmpeg2theora sound-icons

#algunos codecs ---------------------------------------------------------------------------------------------------------------
$i lame libdvdnav4 libfaac0 libmad0 libmp3lame0 libquicktime2 libstdc++5 libxvidcore4 twolame vorbis-tools x264
$i gstreamer1.0-x gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-alsa gstreamer1.0-pulseaudio gstreamer1.0-tools

# fuentes browser --------------------------------------------------------------------------------------------------------------------
$i fonts-noto fonts-noto-cjk fonts-noto-extra fonts-noto-color-emoji

#paquetes del usuario ---------------------------------------------------------------------------------------------------------------------
$i1 kitty feh dunst libnotify-bin faba-icon-theme ripgrep chromium


#Algunas opciones 
#mpv or vlc - reproductor de video
#mpd and ncmpcpp - reproductor de audio
#viewnior - visor de imagenes
#simplescreenrecorder - grabar pantalla 
#devscripts 


#install npm, nodejs and pip installer ----------------------------------------------------------------------------------------------------------
$i nodejs npm python3-pip 

#install cargo ---------------------------------------------------------------------------------------------------------------------------------------
cd
curl https://sh.rustup.rs -sSf | sh

#paquetes requeridos para picom --------------------------------------------------------------------------------------------------------------------------
$i libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-dpms0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl-dev libegl-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev meson

#install picom --------------------------------------------------------------------------------------------------------------------------------------------------
cd
git clone https://github.com/yshui/picom
cd picom/
git submodule update --init --recursive
meson setup --buildtype=release . build
ninja -C build
sudo ninja -C build install

#paquetes requeridos para i3-gaps ------------------------------------------------------------------------------------------------------------------------------------
$i meson dh-autoreconf libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev libxcb-shape0 libxcb-shape0-dev i3status

#Install i3 ----------------------------------------------------------------------------------------------------------------------------------------------------------------
cd
git clone https://github.com/Airblader/i3 i3-gaps
cd i3-gaps
mkdir -p build && cd build
meson --prefix /usr/local
ninja
sudo ninja install

cd
touch .xinitrc

#.xinitrc
echo -e "exec dbus-run-session i3" > $HOME/.xinitrc

#Install pfetch
cd
wget https://github.com/dylanaraps/pfetch/archive/master.zip
unzip master.zip
sudo install pfetch-master/pfetch /usr/local/bin/
ls -l /usr/local/bin/pfetch
rm -r master.zip

#fuentes del usuario 
cd
sudo cp -r ~/i3wm-dotfiles/config/fonts/JetBrainsMonoFonts /usr/share/fonts/

#kitty files
cd
cp -r ~/i3wm-dotfiles/config/kitty/ ~/.config/

#i3 files
cd
cp -r ~/i3wm-dotfiles/config/i3/ ~/.config/

#dunst files
cd
cp -r ~/i3wm-dotfiles/config/dunst/ ~/.config/

#picom files
cd
cp -r ~/i3wm-dotfiles/config/picom/ ~/.config/

#wallpapers
cp -r ~/i3wm-dotfiles/wallpapers/ ~/.local/share/


sudo apt autoremove

printf "\e[1;32mReinicia para aplicar cambios.\e[0m\n"
