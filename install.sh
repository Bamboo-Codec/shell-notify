#!/bin/bash
echo "Instalador de Shell Notify"
#if [[ $EUID -ne 0 ]]; then
#    echo "Este script requiere privilegios de administrador. Ejecutalo con: sudo $0"
#    exit 1
#fi


promt='export PROMPT_COMMAND="$HOME/shell-notify/bin/shell-notify-check.sh;$PROMPT_COMMAND"'
#echo $promt

echo "Creando carpeta de configuracion..."
sleep 1
mkdir -p "$HOME/.config/shell-notify"
mkdir -p "$HOME/.config/shell-notify/icon" #crea carpeta del icono
cp config/default.conf "$HOME/.config/shell-notify/config.conf" #copia la config basica a su carpeta
echo "Cargando configuración..."
sleep 1
cp icon/shell-notify.svg "$HOME/.config/shell-notify/icon/shell-notify.svg" #copia el icono a su carpeta
echo "Cargando iconos..."
sleep 1
#Crear archivo.desktop
echo "Creando acceso directo..."
sleep 1
mkdir -p "$HOME/.local/share/applications"
Desktop="$HOME/shell-notify/config/shell-notify.desktop.in"
sed "s|@HOME@|$HOME|g" "$Desktop" > "$HOME/.local/share/applications/shell-notify.desktop"
echo "Acceso directo creado con éxito"
chmod +x "$HOME/.local/share/applications/shell-notify.desktop"

find "$HOME/.config/shell-notify" -type f -name "*.sh" -exec chmod +x {} \;

if ! grep -q "shell-notify-check.sh" "$HOME/.bashrc"; then
    echo $promt >> "$HOME/.bashrc"
    source "$HOME/.bashrc"
else
    sudo sed -i "/shell-notify-check.sh/d" "$HOME/.bashrc"
fi

echo "Instalacion completada"
echo "Intente abriendo una nueva terminal"
