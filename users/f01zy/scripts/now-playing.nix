{ pkgs }:
pkgs.writeShellScriptBin "now-playing" ''
  #!/usr/bin/env bash
  status=$(playerctl -p spotify status 2>/dev/null) || exit 0
  [ "$status" = "Playing" ] || exit 0
  artist=$(playerctl -p spotify metadata --format '{{xesam:artist}}')
  title=$(playerctl -p spotify metadata --format '{{xesam:title}}')
  [ -n "$artist" ] && [ -n "$title" ] || exit 0
  printf '{"text":"  %s - %s"}\n' "$artist" "$title"
''
