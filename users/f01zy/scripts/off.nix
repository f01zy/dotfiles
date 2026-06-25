{ pkgs }:
pkgs.writeShellScriptBin "off" ''
  #!/usr/bin/env bash
  set -e
  set -u

  all=(lockscreen logout suspend hibernate reboot shutdown)
  declare -A texts=(
    [lockscreen]="Lock screen"
    [logout]="Logout"
    [suspend]="Suspend"
    [hibernate]="Hibernate"
    [reboot]="Reboot"
    [shutdown]="Shutdown"
  )

  declare -A actions=(
    [lockscreen]="swaylock"
    [logout]="loginctl terminate-session ''${XDG_SESSION_ID-}"
    [suspend]="systemctl suspend"
    [hibernate]="systemctl hibernate"
    [reboot]="systemctl reboot"
    [shutdown]="systemctl poweroff"
  )

  confirmations=(reboot shutdown logout)
  echo -e "\0no-custom\x1ftrue"

  if [ $# -eq 0 ]
  then
    echo -e "\0prompt\x1fPower menu"
    for entry in "''${all[@]}"
    do
      echo -e "''${texts[$entry]}"
    done
  else
    selection="$1"

    if [ "$selection" = "No, cancel" ]
    then
      exit 0
    fi

    for entry in "''${all[@]}"
    do
      if [ "$selection" = "''${texts[$entry]}" ]
      then
      for confirm in "''${confirmations[@]}"
      do
      if [ "$entry" = "$confirm" ]
      then
      echo -e "\0prompt\x1fAre you sure?"
      echo -e "Yes, ''${texts[$entry],,}"
      echo -e "No, cancel"
      exit 0
      fi
      done
      exec ''${actions[$entry]}
      fi

      if [ "$selection" = "Yes, ''${texts[$entry],,}" ]
      then
      exec ''${actions[$entry]}
      fi
    done
  fi
''
