#!/bin/bash

# Actualizar la lista de paquetes
sudo apt update && sudo apt upgrade -y

# Eliminar juegos pre-instalados
sudo apt purge -y aisleriot five-or-more four-in-a-row gnome-chess hitori gnome-klotski gnome-mahjongg gnome-mines gnome-nibbles gnome-robots gnome-sudoku gnome-taquin gnome-tetravex iagno lightsoff quadrapassel swell-foop tali

# Eliminar la suite de LibreOffice
sudo apt purge -y libreoffice*

# Instalar Flatpak
sudo apt install -y flatpak

# Añadir el repositorio de Flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Instalar aplicaciones con Flatpak
flatpak install flathub edu.mit.Scratch -y
flatpak install flathub com.visualstudio.code -y
flatpak install flathub com.brave.Browser -y
flatpak install flathub com.microsoft.Edge -y
flatpak install flathub org.mozilla.firefox -y
flatpak install flathub org.libreoffice.LibreOffice -y
flatpak install flathub com.ultimaker.Cura -y

# Configuración de Touchpad
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.desktop.peripherals.touchpad click-method 'fingers'

# Desactivar solicitud de contraseña al inicio de sesión
echo "Configurando inicio de sesión automático para GDM..."

if ! grep -q "\[daemon\]" /etc/gdm3/daemon.conf; then
    echo "[daemon]" | sudo tee -a /etc/gdm3/daemon.conf
fi

sudo sed -i 's/^#*\(\s*AutomaticLoginEnable\s*=\s*\).*/\1true/' /etc/gdm3/daemon.conf
sudo sed -i 's/^#*\(\s*AutomaticLogin\s*=\s*\).*/\1ecobiblioteca/' /etc/gdm3/daemon.conf

# Desactivar la pantalla de GRUB al inicio
echo "Configurando GRUB para iniciar directamente..."
sudo sed -i 's/GRUB_TIMEOUT=.*/GRUB_TIMEOUT=0/' /etc/default/grub
sudo sed -i 's/GRUB_HIDDEN_TIMEOUT=.*/GRUB_HIDDEN_TIMEOUT=0/' /etc/default/grub
sudo update-grub

echo "Configuración aplicada con éxito"
