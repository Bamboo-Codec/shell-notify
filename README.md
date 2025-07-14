# Shell-Notify by Bamboo-codec

<p align="center">
  <img src="https://i.imgur.com/RiqxcTj.png" alt="Logo del proyecto" width="500"/>
</p>

**Version 1.0**

### Descripcion
 
Shell Notify es una herramienta simple que emite un sonido personalizado cuando un proceso de terminal termina.
Incluye una GUI para activar/desactivar la alarma y elegir el sonido de notificación


### Dependencias
yad ~ Interfaz



## Instalación
**Ajusta los comandos a tu distribución** <br>

### Instalar dependencias
```bash
sudo pacman -S yad
```
### Clonar repositorio
```bash
git clone https://github.com/Bamboo-Codec/Shell-Notify.git
```

### Instalar programa
```bash
cd Shell-Notify
./install.sh
```

### Uso
El instalador genera un ejecutable para la interfaz.
Ve en tu administrador de apliaciones, en la categoría "Utilities" o escribe en el buscador "shell-notify" y ejecutálo. <br>

<p align="center">
  <img src="https://i.imgur.com/MpP43Jt.png" alt="Interfaz"/>
</p>

La interfaz tiene solamente dos campos. <br>
El campo **Activado** sirve para activar o desactivar el programa. Cuando esté activado, cada vez que ejecutemos una linea de comando se reproducirá el sonido por defecto.

El campo **Folder List** sirve para elegir la ruta del sonido. El sonido por defecto se encuentra en 
```bash
/usuario/shell-notify/sounds/default.mp3
```
pero se puede seleccionar otro sonido.
<br>


# Notas
+ Los sonidos deben ser en formato .mp3
+ Al ejecutarse el sonido despues de la línea de comando, aparecerá el log del sonido en la shell. Esto será solucionado en versiones posteriores.