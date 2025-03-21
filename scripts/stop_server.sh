#!/bin/bash
# stop_server.sh

# Detener el script si ocurre algún error
set -e

# Verificar si Apache está en ejecución y detenerlo
if systemctl is-active --quiet apache2; then
    echo "Deteniendo Apache..."
    sudo systemctl stop apache2
    echo "Apache detenido correctamente."
else
    echo "Apache no está en ejecución."
fi
