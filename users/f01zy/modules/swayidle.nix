{ pkgs, ... }:
let
  lock = "${pkgs.swaylock}/bin/swaylock -f";
  display = status: "${pkgs.sway}/bin/swaymsg 'output * power ${status}'";
in
{
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 120;
        command = lock;
      }
      {
        timeout = 125;
        command = display "off";
        resumeCommand = display "on";
      }
      {
        timeout = 130;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
  };
}
