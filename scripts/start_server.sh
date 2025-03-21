#!/bin/bash
# start_server.sh

# Detener el script si ocurre algún error
set -e

# Verificar si Apache ya está en ejecución
if systemctl is-active --quiet apache2; then
    echo "Apache ya está en ejecución."
else
    echo "Iniciando Apache..."
    sudo systemctl start apache2
    echo "Apache iniciado correctamente."
fi