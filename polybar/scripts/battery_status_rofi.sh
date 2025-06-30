#!/bin/bash

battery_info=$(acpi)
battery=$(echo $battery_info | awk '{print $4}' | sed 's/,//')
status=$(echo $battery_info | awk '{print $3}' | sed 's/,//')
time=$(echo $battery_info | awk '{print $5}')
percentage=${battery%%%}

# Elegir ícono según nivel
if [ "$percentage" -ge 80 ]; then
  icon=''  
elif [ "$percentage" -ge 60 ]; then
  icon=''  
elif [ "$percentage" -ge 40 ]; then
  icon='' 
elif [ "$percentage" -ge 20 ]; then
  icon=''  
else
  icon=''  
fi

# Prefijo si está cargando
if [[ "$status" == "Charging" ]]; then
  icon=" $icon"
fi

# Mensaje detallado
msg="🔋 $icon $percentage%\n⚡ Estado: $status\n⏱ Tiempo estimado: ${time:-N/A}"

# Mostrar en rofi
echo -e "$msg" | rofi -dmenu -p "Batería" -theme ~/.config/polybar/scripts/rofi/rofi-battery.rasi  -location 1 -yoffset 30 -theme-str 'window { width: 250px; }'

