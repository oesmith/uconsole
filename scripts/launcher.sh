#!/bin/sh

set -e

list() {
  jq -r '.[] | "img:\(.icon):text:\(.name)"' < ~/.config/launcher/apps.json
}

select() {
  list | wofi --show=dmenu --allow-images | cut -d ':' -f 4
}

get_cmd() {
  jq -r '.[] | select(.name == "'"$1"'") | .cmd' < ~/.config/launcher/apps.json
}

selection=`select`
cmd=`get_cmd "$selection"`

if [ -n "$cmd" ] ; then
  exec $cmd
fi
