{ pkgs }:
pkgs.writeShellScriptBin "menu" ''
  #!/usr/bin/env bash
  if [ "$1" = "launcher" ]; then
    rofi -no-lazy-grab -show drun -modi drun -theme launcher
  elif [ "$1" = "powermenu" ]; then
    rofi -show powermenu -modi powermenu:off -theme powermenu
  fi
''
