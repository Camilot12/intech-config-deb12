#!/bin/bash

# Define tu partición de arranque; ajusta esto según tu configuración
BOOT_PARTITION="/dev/sda"

# Reinstalar GRUB
echo "Reinstalando GRUB en $BOOT_PARTITION..."
sudo grub-install $BOOT_PARTITION

# Actualizar configuración de GRUB
echo "Actualizando configuración de GRUB..."
sudo update-grub

echo "Operación completada. Por favor, reinicia tu sistema."
