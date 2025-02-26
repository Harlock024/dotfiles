#!/



bluetooth_status=$(bluetoothctl show | grep "Powered: yes" &> /dev/null && echo "on" || echo "off")

device_connected=$(bluetoothctl info | grep "Connected: yes" &> /dev/null && bluetoothctl info | grep "Name" | cut -d ' ' -f 2- || echo "No conectado")

if [ "$bluetooth_status" = "on" ]; then
    echo " $device_connected"
else
    echo " Bluetooth apagado"
fi

