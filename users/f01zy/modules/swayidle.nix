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
        timeout = 600;
        command = lock;
      }
      {
        timeout = 1800;
        command = display "off";
        resumeCommand = display "on";
      }
      {
        timeout = 1805;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
  };
}
