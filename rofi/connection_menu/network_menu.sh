
#!/bin/bash

# Comprobar la versión de nmcli y NetworkManager
if [[ "$(nmcli -v)" != "nmcli (1.50.0)" || "$(nmcli -f version NetworkManager)" != "NetworkManager (1.48.10)" ]]; then
    echo "Advertencia: Las versiones de nmcli y NetworkManager no coinciden. Reiniciando NetworkManager..."
    sudo systemctl restart NetworkManager
fi

# Obtener redes Wi-Fi disponibles
network=$(nmcli device wifi list | awk '{print $2}' | tail -n +2 | rofi -dmenu -p "Red Wi-Fi")

if [ -n "$network" ]; then
    password=$(rofi -dmenu -password -p "Contraseña para $network")
    
    if [ -n "$password" ]; then
        if nmcli dev wifi connect "$network" password "$password"; then
            echo "Conectado a $network"
        else
            echo "Error al conectar a $network"
        fi
    else
        echo "Contraseña no proporcionada"
    fi
else
    echo "No se seleccionó ninguna red"
fi

