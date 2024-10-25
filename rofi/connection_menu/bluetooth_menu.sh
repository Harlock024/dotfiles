#!/bin/bash

# Verificar estado de Bluetooth
bluetooth_status=$(bluetoothctl show | grep "Powered: yes" &> /dev/null && echo "on" || echo "off")

# Obtener la lista de dispositivos emparejados
device_list=$(bluetoothctl devices | awk '{print $2 " " substr($0, index($0,$3))}')

# Obtener la lista de dispositivos conectados
connected_devices=$(bluetoothctl devices | grep "Connected: yes" | awk '{print $2 " " substr($0, index($0,$3))}')

# Menú de opciones
menu=$(echo -e "Encender Bluetooth\nApagar Bluetooth\nConectar Dispositivo\nDesconectar Dispositivo" | rofi -dmenu -p "Bluetooth")

case "$menu" in
    "Encender Bluetooth")
        bluetoothctl power on
        ;;
    "Apagar Bluetooth")
        bluetoothctl power off
        ;;
    "Conectar Dispositivo")
        # Mostrar lista de dispositivos emparejados
        if [ -z "$device_list" ]; then
            notify-send "No hay dispositivos emparejados."
        else
            device=$(echo "$device_list" | rofi -dmenu -p "Seleccionar dispositivo")
            if [ -n "$device" ]; then
                mac=$(echo "$device" | awk '{print $1}')
                bluetoothctl connect "$mac"
            fi
        fi
        ;;
    "Desconectar Dispositivo")
        # Mostrar lista de dispositivos conectados
        if [ -z "$connected_devices" ]; then
            notify-send "No hay dispositivos conectados."
        else
            device=$(echo "$connected_devices" | rofi -dmenu -p "Seleccionar dispositivo")
            if [ -n "$device" ]; then
                mac=$(echo "$device" | awk '{print $1}')
                bluetoothctl disconnect "$mac"
            fi
        fi
        ;;
    *)
        exit 1
        ;;
esac

