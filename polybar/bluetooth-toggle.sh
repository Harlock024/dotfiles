#!/bin/bash

bluetooth_status=$(bluetoothctl show | grep "Powered: yes")

if [ -z "$bluetooth_status" ]; then
    # Si está apagado, lo enciende
    bluetoothctl power on
else
    # Si está encendido, lo apaga
    bluetoothctl power off
fi

