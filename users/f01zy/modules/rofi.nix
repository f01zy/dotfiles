let
  al = "#00000000";
  bg = "#24273A";
  se = "#1E1E2E";
  fg = "#BF616A";
  ac = "#24273A";
in
{ ... }: {
  programs.rofi = {
    enable = true;
  };

  xdg.configFile."rofi/launcher.rasi".text = ''
    configuration {
      font:                       "Iosevka Nerd Font 12";
      show-icons:                 true;
      icon-theme:                 "Papirus";
      display-drun:               " ";
      drun-display-format:        "{name}";
      disable-history:            false;
      sidebar-mode:               false;
    }

    window {
      transparency:               "real";
      background-color:           ${bg};
      text-color:                 ${fg};
      border-radius:              8px;
      width:                      28%;
      location:                   center;
    }

    prompt {
      enabled:                    true;
      background-color:           ${al};
      text-color:                 #81A1C1;
      font:                       "Iosevka Nerd Font 12";
    }

    entry {
      background-color:           ${al};
      text-color:                 #87CEFA;
      placeholder-color:          #575268;
      expand:                     true;
      placeholder:                "Search";
      blink:                      true;
      margin:                     0px 0px 0px 6px;
    }

    inputbar {
      children:                   [ prompt, entry ];
      background-color:           ${ac};
      text-color:                 ${fg};
      expand:                     false;
      padding:                    14px 16px;
      border-radius:              8px 8px 0px 0px;
    }

    listview {
      background-color:           ${al};
      columns:                    1;
      lines:                      5;
      cycle:                      false;
      dynamic:                    true;
      layout:                     vertical;
      padding:                    8px;
    }

    mainbox {
      background-color:           ${al};
      children:                   [ inputbar, listview ];
    }

    element {
      background-color:           ${al};
      text-color:                 #ffffff;
      orientation:                horizontal;
      border-radius:              6px;
      padding:                    8px 12px;
    }

    element-icon {
      background-color:           inherit;
      text-color:                 inherit;
      horizontal-align:           0.5;
      vertical-align:             0.5;
      size:                       24px;
    }

    element-text {
      background-color:           ${al};
      text-color:                 inherit;
      expand:                     true;
      horizontal-align:           0;
      vertical-align:             0.5;
      margin:                     0px 0px 0px 12px;
    }

    element selected {
      background-color:           ${se};
      text-color:                 ${fg};
    }
  '';
}
