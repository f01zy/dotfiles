{ pkgs, ... }: {
  wayland.windowManager.sway = {
    enable = true;
    checkConfig = false;
    wrapperFeatures.gtk = true;
    package = pkgs.swayfx;

    config = {
      modifier = "Mod4";
      terminal = "alacritty";
      menu = "rofi";

      fonts = {
        names = [ "Iosevka Nerd Font" ];
        size = 10.0;
      };

      gaps = {
        inner = 4;
        outer = 4;
      };

      seat = {
        "*" = {
          xcursor_theme = "Bibata-Modern-Ice 18";
        };
      };

      window = {
        border = 3;
        titlebar = false;
      };

      floating = {
        modifier = "Mod4";
      };

      input = {
        "type:touchpad" = {
          events = "disabled";
        };
        "type:keyboard" = {
          xkb_layout = "us,ru";
          xkb_options = "grp:alt_shift_toggle";
        };
      };

      keybindings =
        let
          mod = "Mod4";
        in
        {
          "${mod}+Return" = "exec alacritty";
          "${mod}+Shift+q" = "kill";
          "${mod}+d" = "exec menu launcher";
          "${mod}+p" = "exec menu powermenu";
          "${mod}+Shift+c" = "reload";

          "${mod}+h" = "focus left";
          "${mod}+j" = "focus down";
          "${mod}+k" = "focus up";
          "${mod}+l" = "focus right";
          "${mod}+Left" = "focus left";
          "${mod}+Down" = "focus down";
          "${mod}+Up" = "focus up";
          "${mod}+Right" = "focus right";

          "${mod}+Shift+h" = "move left";
          "${mod}+Shift+j" = "move down";
          "${mod}+Shift+k" = "move up";
          "${mod}+Shift+l" = "move right";
          "${mod}+Shift+Left" = "move left";
          "${mod}+Shift+Down" = "move down";
          "${mod}+Shift+Up" = "move up";
          "${mod}+Shift+Right" = "move right";

          "${mod}+1" = "workspace number 1";
          "${mod}+2" = "workspace number 2";
          "${mod}+3" = "workspace number 3";
          "${mod}+4" = "workspace number 4";
          "${mod}+5" = "workspace number 5";
          "${mod}+6" = "workspace number 6";
          "${mod}+7" = "workspace number 7";
          "${mod}+8" = "workspace number 8";
          "${mod}+9" = "workspace number 9";
          "${mod}+0" = "workspace number 10";

          "${mod}+Shift+1" = "move container to workspace number 1";
          "${mod}+Shift+2" = "move container to workspace number 2";
          "${mod}+Shift+3" = "move container to workspace number 3";
          "${mod}+Shift+4" = "move container to workspace number 4";
          "${mod}+Shift+5" = "move container to workspace number 5";
          "${mod}+Shift+6" = "move container to workspace number 6";
          "${mod}+Shift+7" = "move container to workspace number 7";
          "${mod}+Shift+8" = "move container to workspace number 8";
          "${mod}+Shift+9" = "move container to workspace number 9";
          "${mod}+Shift+0" = "move container to workspace number 10";

          "${mod}+b" = "splith";
          "${mod}+v" = "splitv";
          "${mod}+s" = "layout stacking";
          "${mod}+w" = "layout tabbed";
          "${mod}+e" = "layout toggle split";
          "${mod}+f" = "fullscreen";
          "${mod}+Shift+space" = "floating toggle";
          "${mod}+space" = "focus mode_toggle";
          "${mod}+a" = "focus parent";

          "${mod}+Shift+minus" = "move scratchpad";
          "${mod}+minus" = "scratchpad show";
          "${mod}+r" = "mode resize";

          "--locked XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
          "--locked XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";
          "--locked XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
          "--locked XF86AudioMicMute" = "exec pactl set-source-mute @DEFAULT_SOURCE@ toggle";
          "--locked XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
          "--locked XF86MonBrightnessUp" = "exec brightnessctl set 5%+";

          "XF86Launch4" = "exec swaylock -f && systemctl suspend";
          "Print" = "exec grim -g \"$(slurp)\" -t png - | wl-copy -t image/png";
          "${mod}+Shift+x" = "exec swaylock";
          "${mod}+Shift+z" = "exec zen";
          "${mod}+Shift+o" = "exec obsidian";
          "${mod}+Shift+w" = "exec wallpaper random";
        };

      modes = {
        resize = {
          "h" = "resize shrink width 10px";
          "j" = "resize grow height 10px";
          "k" = "resize shrink height 10px";
          "l" = "resize grow width 10px";
          "Left" = "resize shrink width 10px";
          "Down" = "resize grow height 10px";
          "Up" = "resize shrink height 10px";
          "Right" = "resize grow width 10px";
          "Return" = "mode default";
          "Escape" = "mode default";
        };
      };

      bars = [
        { command = "${pkgs.waybar}/bin/waybar"; }
      ];

      startup = [
        {
          command = "swaymsg output VGA-1 disable && swaymsg output VGA-2 disable";
          always = true;
        }
        {
          command = "wallpaper init";
          always = true;
        }
      ];

      colors = {
        focused = {
          border = "#89b4fa";
          childBorder = "#89b4fa";
          background = "#89b4fa";
          text = "#1e1e2e";
          indicator = "#f5e0dc";
        };
      };
    };

    extraConfig = ''
      corner_radius 8
      blur disable
      for_window [app_id="Alacritty"] blur enable
      for_window [app_id="Alacritty"] blur_passes 2
      for_window [app_id="Alacritty"] blur_radius 4
    '';
  };
}
