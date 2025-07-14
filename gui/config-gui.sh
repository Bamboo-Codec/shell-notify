#!/bin/bash
#Configuracion de gui

patron="shell-notify-check.sh"
promt='export PROMPT_COMMAND="$HOME/shell-notify/bin/shell-notify-check.sh;$PROMPT_COMMAND"'
#echo "Creando patron. Patron: $patron"

CONFIG="$HOME/.config/shell-notify/config.conf"
#echo "ruta config: $CONFIG"
mkdir -p "$(dirname "$CONFIG")"

#Si no existe, crear config basica
if [ ! -f "$CONFIG" ]; then
    #echo "no existe ruta config, creando archivo config.conf"
    echo "false|$HOME/shell-notify/sounds/default.mp3" > $CONFIG
fi

#Lee el archivo config
#echo "leyendo archivo config"
#echo "Extrayendo estado y sonido"
IFS='|' read estado sonido < "$CONFIG"
#echo "Estado: $estado"
#echo "Sonido: $sonido"

resultado=$( yad \
 --window-icon="$HOME/.config/shell-notify/icon/shell-notify.svg" \
 --title="Shell notify" \
 --form \
 --text-align="center" \
 --field="Activado:SW" "$estado" \
 --field="Folder List:SFL" $sonido \
 --button="Aceptar":0 \
 --button="Cancelar":1 \
)

ans=$?
if [ $ans -eq 0 ]; then
    #echo "elegiste  la opcion 0:Aceptar"
    activo=$(echo "$resultado" | cut -d '|' -f1)
    ruta_archivo=$(echo "$resultado" | cut -d '|' -f2)
    activo=$(echo "$activo" | tr '[:upper:]' '[:lower:]')
    echo "$activo|$ruta_archivo" > $CONFIG
    echo "$activo|$ruta_archivo"
    if [ "$activo" = "true" ]; then #si esta activada la notify
        if ! grep -q "$patron" "$HOME/.bashrc"; then
            echo "GUI: no se encontró la linea para el promt en bashrc"
            echo "Agregando promt"
            echo "$promt" >> "$HOME/.bashrc"
        fi
    else
        echo "GUI: Estado de notify inactivo"
    fi
fi
