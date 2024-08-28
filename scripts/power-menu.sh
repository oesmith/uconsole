#!/bin/bash

set -e

entries="⇠ Logout\n\uead2 Reboot\n⏻ Shutdown"

selected=$(echo -e $entries|wofi --width 250 --height 210 --dmenu --cache-file /dev/null | awk '{print tolower($2)}')

case $selected in
  logout)
    swaymsg exit;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff;;
esac
