#!/bin/bash
# install_dependencies.sh

# Detener el script si ocurre algún error
set -e

# Actualizar la lista de paquetes
sudo apt update

# Instalar Apache si no está instalado
if ! command -v apache2 &> /dev/null; then
    echo "Instalando Apache..."
    sudo apt install -y apache2
else
    echo "Apache ya está instalado."
fi

# Instalar Ruby si no está instalado
if ! command -v ruby &> /dev/null; then
    echo "Instalando Ruby..."
    sudo apt install -y ruby-full
else
    echo "Ruby ya está instalado."
fi

# Iniciar Apache si no está en ejecución
if ! systemctl is-active --quiet apache2; then
    echo "Iniciando Apache..."
    sudo systemctl start apache2
else
    echo "Apache ya está en ejecución."
fi

# Habilitar Apache para que se inicie automáticamente al arrancar el sistema
sudo systemctl enable apache2

echo "Dependencias instaladas y configuradas correctamente."