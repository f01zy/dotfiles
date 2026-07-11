{ pkgs }:
pkgs.writeShellScriptBin "now-playing" ''
  #!/usr/bin/env bash

  status=$(playerctl -p ncspot status 2>/dev/null) || exit 0
  [ "$status" = "Playing" ] || exit 0

  artist=$(playerctl -p ncspot metadata --format '{{xesam:artist}}')
  title=$(playerctl -p ncspot metadata --format '{{xesam:title}}')
  album=$(playerctl -p ncspot metadata --format '{{xesam:album}}')
  [ -n "$artist" ] && [ -n "$title" ] || exit 0

  tooltip="<span alpha='72%'>󰠃 Artist</span>   <span alpha='96%'>''${artist}</span>\\n<span alpha='72%'>󰀥 Album</span>    <span alpha='96%'>''${album}</span>\\n<span alpha='72%'> Song</span>     <span alpha='96%'>''${title}</span>"

  printf '{"text":"  %s", "tooltip":"%s"}\n' "$artist" "$tooltip"
''
