#!/bin/bash
#Chequeo de si existe el archivo de config
CONFIG="$HOME/.config/shell-notify/config.conf"

#Si no existe el archivo, salir
[ ! -f "$CONFIG" ] && exit 0

#Leer config: ruta_del_sonido | activado
IFS='|' read ACTIVADO SONIDO < "$CONFIG"
SONIDO="${SONIDO//\$HOME/$HOME}"   # Expandir $HOME
#echo "Estado: $ACTIVADO"
#echo "Sonido: $SONIDO"


if [ "$ACTIVADO" == "true" ]; then
    #echo "Reproduciendo $SONIDO"
    mpg123 "$SONIDO" -q
fi
