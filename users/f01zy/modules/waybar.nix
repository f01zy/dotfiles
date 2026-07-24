{ ... }: {
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 25;
        modules-left = [
          "sway/workspaces"
          "custom/separator"
          "custom/now-playing"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "tray"
          "custom/separator"
          "cpu"
          "custom/separator"
          "memory"
          "custom/separator"
          "network"
          "custom/separator"
          "pulseaudio"
        ];
        "custom/separator" = {
          format = "|";
          interval = "once";
          tooltip = false;
        };
        "custom/now-playing" = {
          exec = "now-playing";
          interval = 1;
          format = "{}";
          return-type = "json";
          tooltip = false;
        };
        "sway/workspaces" = {
          disable-scroll = true;
        };
        "clock" = {
          interval = 60;
          format = "{:%d %B %Y - %H:%M}";
          tooltip = false;
        };
        "cpu" = {
          interval = 1;
          format = "<span> </span> {usage}%";
          tooltip = false;
        };
        "memory" = {
          interval = 300;
          format = "<span> </span> {percentage}%";
          tooltip-format = "{used:0.2f}GiB used out of {total:0.2f}GiB";
        };
        "network" = {
          interval = 1;
          format-wifi = "<span> </span> {essid} ({signalStrength}%)";
          format-ethernet = "<span> </span> {ifname} ({ipaddr})";
          format-linked = "<span> </span> {essid} (No IP)";
          format-disconnected = "Disconnected";
          tooltip = false;
        };
        "pulseaudio" = {
          scroll-step = 1;
          format = "<span>{icon}</span> {volume}%";
          format-muted = "󰝟 Muted";
          format-icons = {
            default = [
              "󰕿"
              "󰖀"
              "󰕾"
            ];
          };
          states = {
            warning = 85;
          };
          tooltip = false;
          on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
        };
        "tray" = {
          spacing = 8;
        };
      };
    };

    style = ''
      * {
        font-family: "Iosevka Nerd Font";
        font-size: 11pt;
        border: none;
        border-radius: 0;
        transition-property: background-color;
        transition-duration: 0.5s;
      }
      window#waybar {
        color: #cdd6f4;
        background-color: #1e1e2e;
        border-bottom: 1px solid #45475a;
        transition-duration: 0.5s;
        transition-property: background-color;
      }
      #workspaces button {
        background: #1e1e2e;
        color: #cdd6f4;
        border-bottom: 1px solid #45475a;
        padding-top: 0px;
        padding-bottom: 0px;
        padding-left: 4px;
        padding-right: 4px;
      }
      #workspaces button.focused {
        color: #11111b;
        background: #89b4fa;
      }
      #workspaces button.urgent {
        color: #f38ba8;
      }
      #workspaces button.persistent {
        color: #585b70;
      }
      #workspaces button:hover {
        color: #11111b;
        background: #b4befe;
        box-shadow: inherit;
      }
      #clock,
      #custom-now-playing,
      #network,
      #pulseaudio,
      #cpu,
      #memory,
      #tray {
        margin: 0px 2px;
        padding: 0.2rem 0.6rem;
        color: #cdd6f4;
        background: #1e1e2e;
        border-bottom: 1px solid #45475a;
      }
      #tray {
        margin: 0 0 0 2px;
      }
      #custom-separator {
        color: #45475a;
        background: #1e1e2e;
        border-bottom: 1px solid #45475a;
      }
    '';
  };
}
