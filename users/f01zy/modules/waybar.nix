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
          "mpd"
          "custom/todo"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "network"
          "custom/separator"
          "pulseaudio"
          "custom/separator"
          "cpu"
          "custom/separator"
          "memory"
        ];
        "custom/separator" = {
          format = "|";
          interval = "once";
          tooltip = false;
        };
        "sway/workspaces" = {
          disable-scroll = true;
        };
        "clock" = {
          interval = 60;
          format = "{:%d %B %Y - %I:%M %p}";
          tooltip = false;
        };
        "mpd" = {
          max-length = 30;
          format = "<span> </span> {title}";
          format-paused = "<span> </span> {title}";
          format-stopped = "";
          format-disconnected = "";
          on-click = "mpc --quiet toggle";
          on-click-right = "mpc ls | mpc add";
          on-click-middle = "alacritty -e ncmpcpp";
          on-scroll-up = "mpc --quiet prev";
          on-scroll-down = "mpc --quiet next";
          smooth-scrolling-threshold = 5;
          tooltip-format = "{title} - {artist} ({elapsedTime:%M:%S}/{totalTime:%H:%M:%S})";
        };
        "disk" = {
          interval = 18000;
          format = "<span> </span> {percentage_used}%";
          tooltip-format = "{used} used out of {total} on {path}";
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
        transition-duration: 0.2s;
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
      #mpd,
      #idle_inhibitor,
      #custom-cava-internal,
      #disk,
      #backlight,
      #temperature,
      #bluetooth,
      #network,
      #pulseaudio,
      #cpu,
      #memory,
      #battery,
      #mode {
        margin: 0px 2px;
        padding: 0.2rem 0.6rem;
        color: #cdd6f4;
        background: #1e1e2e;
        border-bottom: 1px solid #45475a;
      }
      #mode,
      #tray {
        margin: 0 0 0 2px;
      }
      @keyframes blink {
        to {
          color: #cdd6f4;
          background-color: #1e1e2e;
        }
      }
      #battery.critical:not(.charging) {
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
        color: #f38ba8;
        background-color: #1e1e2e;
      }
      #battery.charging {
        color: #a6e3a1;
        background-color: #1e1e2e;
      }
      #mpd.paused {
        color: #585b70;
        background-color: #1e1e2e;
      }
      #mpd.stopped {
        background: transparent;
      }
      #custom-separator {
        color: #45475a;
        background: #1e1e2e;
        border-bottom: 1px solid #45475a;
      }
      #idle_inhibitor {
        color: #94e2d5;
      }
      #custom-cava-internal{
        font-family: "Iosevka Nerd Font" ;
      }
    '';
  };
}
