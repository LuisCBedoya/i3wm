#!/bin/bash

i="sudo apt install -y"
i1="sudo apt install --no-install-recommends -y"
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

echo "|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|"
echo "| Workspace Installer  |"
echo "|______________________|"
echo ""
echo "Bienvenido al instalador de paquetes para tu sistema."
echo "Este script instalará diversos paquetes esenciales."
echo ""
sleep 2s

echo "|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|"
echo "| X11 - Sistema X      |"
echo "|______________________|"
echo -e "\nInstalando paquetes para X11 (Sistema de ventanas predeterminado)..."
$i xserver-xorg-core xserver-xorg-input-evdev x11-xserver-utils x11-xkb-utils x11-utils xinit xbacklight
echo ""
echo "Paquetes X11 instalados."
echo ""
sleep 2s

echo "|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|"
echo "| GPU - Controladores   |"
echo "|_______________________|"
echo -e "\nInstalando controladores para hardware gráfico..."
# Controlador para Intel
$i xserver-xorg-video-intel
# Controlador para AMD 
# $i xserver-xorg-video-ati xserver-xorg-video-amdgpu
echo ""
echo "Controladores de GPU instalados."
echo ""
sleep 2s

echo "|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|"
echo "| Hardware - Soporte    |"
echo "|_______________________|"
echo -e "\nInstalando librerías y firmware para soporte de hardware..."
$i dmidecode dmraid hdparm open-iscsi mtools avahi-daemon acpi acpid sg3-utils firmware-sof-signed dosfstools dialog
echo ""
echo "Soporte de hardware instalado."
echo ""
sleep 2s

echo "|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|"
echo "| CPU - Microcódigo     |"
echo "|_______________________|"
echo -e "\nInstalando microcódigo específico para CPUs..."
$i intel-microcode
# $i amd64-microcode  # Descomentarlo si usas una CPU AMD
echo ""
echo "Microcódigo instalado."
echo ""
sleep 2s

echo "|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|"
echo "| Nvidia - Controlador  |"
echo "|_______________________|"
echo -e "\nInstalando controlador para GPU Nvidia..."
$i nvidia-driver
echo ""
echo "Controlador Nvidia instalado."
echo ""
sleep 2s

echo "|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|"
echo "| Audio - Sonido      |"
echo "|_____________________|"
echo -e "\nInstalando paquetes de audio..."
$i pulseaudio pulseaudio-utils
echo ""
echo "Paquetes de audio instalados."
echo ""
sleep 2s

echo "|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|"
echo "| Energía - Gestión     |"
echo "|_______________________|"
echo -e "\nInstalando soporte para gestión de energía..."
$i power-profiles-daemon upower
echo ""
echo "Soporte de energía instalado."
echo ""
sleep 2s

echo "|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|"
echo "| Sistema - Archivos    |"
echo "|_______________________|"
echo -e "\nInstalando herramientas para el sistema de archivos..."
$i efitools haveged nfs-common nilfs-tools smartmontools unrar rar tar unzip xz-utils
echo ""
echo "Herramientas de sistema de archivos instaladas."
echo ""
sleep 2s

echo "|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|"
echo "| Red - Controladores |"
echo "|_____________________|"
echo -e "\nInstalando herramientas de red..."
$i b43-fwcutter firmware-iwlwifi dnsmasq dnsutils ethtool modemmanager network-manager wpasupplicant
echo ""
echo "Herramientas de red instaladas."
echo ""
sleep 2s

echo "|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|"
echo "| Herramientas Escritorio|"
echo "|________________________|"
echo -e "\nInstalando herramientas útiles para el escritorio..."
$i bash-completion ffmpegthumbnailer libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi gstreamer1.0-plugins-bad xdg-utils linux-headers-amd64 build-essential pkg-config libglvnd-dev dunst libnotify-bin
echo ""
echo "Herramientas útiles para el escritorio instaladas."
echo ""
sleep 2s

echo "|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|"
echo "| Fuentes               |"
echo "|_______________________|"
echo -e "\nInstalando fuentes adicionales..."
$i ttf-mscorefonts-installer
echo ""
echo "Fuentes instaladas."
echo ""
sleep 2s

#echo "|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|"
#echo "| Firewall              |"
#echo "|____¯__________________|"
#echo -e "\nInstalando y habilitando firewall..."
#$i ufw
#$s ufw enable
#echo "Firewall instalado y habilitado."
#echo ""
#sleep 2s

echo "|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|"
echo "| Herramientas Recomendadas|"
echo "|__________________________|"
echo -e "\nInstalando herramientas recomendadas..."
$i git curl wget inxi htop nvtop intel-gpu-tools
echo ""
echo "Herramientas recomendadas instaladas."
echo ""
sleep 2s

echo "|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|"
echo "| Herramientas Usuario   |"
echo "|________________________|"
echo -e "\nInstalando herramientas para el usuario..."
$i1 lxappearance pcmanfm lxpolkit flameshot zathura gpicview vlc ripgrep
echo ""
echo "Herramientas para el usuario instaladas."
echo ""
sleep 2s

echo "|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|"
echo "| Habilitar Servicios   |"
echo "|_______________________|"
echo -e "\nHabilitando servicios necesarios..."
# Habilitar los servicios que deseas
$s systemctl enable avahi-daemon
$s systemctl enable acpid
echo ""
echo "Servicios habilitados con éxito."
echo ""
sleep 2s

echo "|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|"
echo "| Configuración .xinitrc|"
echo "|_______________________|"
echo -e "\nConfigurando archivo .xinitrc para iniciar sesión con i3..."
echo -e '#autostart
\nexport XDG_SESSION_TYPE=x11
\nexport GDK_BACKEND=x11
\nsetxkbmap latam &
\npipewire &
\nexec dbus-run-session i3' > /home/luc/.xinitrc
echo ""
echo "Archivo .xinitrc configurado."
echo ""
sleep 2s

echo "|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|"
echo "| Agregando archivos a .config |"
echo "|______________________________|"
echo -e "\nCopiando archivos de la carpeta raiz a .config del sistema..."

config_dir="/home/luc/i3wm/config"
dest_dir="/home/luc/.config"
files_to_copy=("alacritty" "dunst" "scripts" "gpicview" "lsd" "mpv" "rofi")

if [ ! -d "$dest_dir" ]; then
  mkdir -p "$dest_dir"
fi

for file in "${files_to_copy[@]}"; do
  src="$config_dir/$file"
  dest="$dest_dir/$file"
  
  if [ -e "$src" ]; then
    echo "Copiando $src a $dest"
    cp -r "$src" "$dest"
  else
    echo "El archivo o directorio $src no existe, saltando."
  fi
done
echo ""
echo "Configuraciones copiadas exitosamente."
echo ""
sleep 2s

echo "|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|"
echo "| Instalación Completada |"
echo "|________________________|"
echo -e "\n¡Instalación completada con éxito!"
echo "El sistema está listo para ser utilizado."
echo "Reiniciando el sistema para aplicar cambios..."
read -p "Presiona cualquier tecla para reiniciar..."
$s reboot
