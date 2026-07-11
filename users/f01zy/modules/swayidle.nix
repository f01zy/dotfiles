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
        timeout = 60;
        command = lock;
      }
      {
        timeout = 65;
        command = display "off";
        resumeCommand = display "on";
      }
      {
        timeout = 70;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
  };
}
