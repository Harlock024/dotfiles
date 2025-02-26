#!/bin/sh


windows=$(wmctrl -l | awk '{$1=$2=$3=""; print substr($0,4)}')


selected_window=$(echo "$windows" | rofi -dmenu -i -p "Window:" | awk '{print $1}')


if [ -n "$selected_window" ]; then
    wmctrl -a "$selected_window"
fi
```
