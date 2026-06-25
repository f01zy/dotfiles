{ pkgs }:
pkgs.writeShellScriptBin "wallpaper" ''
  #!/usr/bin/env bash
  CACHE_FILE="$HOME/.cache/current_wallpaper"
  DIR="$HOME/Wallpapers"

  if ! ${pkgs.procps}/bin/pgrep -x ".awww-daemon-wr" > /dev/null; then
    ${pkgs.awww}/bin/awww-daemon &
    sleep 1
  fi

  if [ "$1" = "init" ] && [ -f "$CACHE_FILE" ]; then
    BG=$(cat "$CACHE_FILE")
  elif [ "$1" = "random" ] && [ -d "$DIR" ]; then
    BG=$(${pkgs.findutils}/bin/find "$DIR" -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" \) | ${pkgs.coreutils}/bin/shuf -n1)
  fi

  if [ -n "$BG" ] && [ -f "$BG" ]; then
    echo "$BG" > "$CACHE_FILE"
    ${pkgs.awww}/bin/awww img "$BG" --transition-type simple --transition-step 10 --transition-fps 60
  fi
''
