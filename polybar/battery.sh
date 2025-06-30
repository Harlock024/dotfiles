

battery_info=$(acpi)
battery=$(echo $battery_info | awk '{print $4}' | sed 's/,//')
status=$(echo $battery_info  | awk '{print $3}' | sed 's/,//')
percentage=${battery%%%}



if [ $percentage -ge 80 ]; then
  icon=' '  
elif [ $percentage -ge 60 ]; then
  icon=' '  
elif [ $percentage -ge 40 ]; then
  icon=' ' 
elif [ $percentage -ge 20 ]; then
  icon=' '  
else
  icon=' '  
fi



if [[ "$status" == "Charging" ]]; then
	icon=" $icon"
elif [[ "$status" == "Discharging" ]]; then
	icon="$icon"
fi

echo "$icon $percentage %"

