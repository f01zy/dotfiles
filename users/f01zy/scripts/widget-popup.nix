{ pkgs, ... }:
pkgs.writeShellScriptBin "widget-popup" ''
  WINDOW="$1"
  if [ -z "$WINDOW" ]; then
    echo "Using: popup <window_name_eww>"
    exit 1
  fi

  LOCK_FILE="$HOME/.cache/eww-$WINDOW.lock"
  EWW_BIN="${pkgs.eww}/bin/eww"

  if ! ${pkgs.procps}/bin/pidof eww >/dev/null; then
    $EWW_BIN daemon
    ${pkgs.coreutils}/bin/sleep 1
  fi

  if [[ ! -f "$LOCK_FILE" ]]; then
    ${pkgs.coreutils}/bin/touch "$LOCK_FILE"
    $EWW_BIN open "$WINDOW"
  else
    $EWW_BIN close "$WINDOW"
    ${pkgs.coreutils}/bin/rm "$LOCK_FILE"
  fi
''
