{ pkgs, ... }:
{
  imports = [
    ./widgets/calendar.nix
    ./widgets/wallpapers.nix
  ];

  home.packages = [
    pkgs.eww
  ];

  xdg.configFile = {
    "eww/eww.yuck".text = ''
      (defvar calendar false)
      (defvar wallpapers false)
      (defvar eww "${pkgs.eww}/bin/eww")
      (defpoll calendar-day :interval "10h" "${pkgs.coreutils}/bin/date '+%d'")
      (defpoll calendar-month :interval "10h" "${pkgs.coreutils}/bin/date '+%B'")
      (defpoll calendar-year :interval "10h" "${pkgs.coreutils}/bin/date '+%Y'")
      (defpoll calendar-short :interval "10h" "${pkgs.coreutils}/bin/date '+%b %d, %Y'")
      (include "widgets/calendar.yuck")
      (include "widgets/wallpapers.yuck")
    '';

    "eww/styles/colors.scss".text = ''
      $base: #1e1e2e;
      $text: #cdd6f4;
      $subtext0: #a6adc8;
      $blue: #89b4fa;
      $mauve: #cba6f7;
      $background: $base;
      $foreground: $text;
      $color1: $blue;
      $color2: $mauve;
      $color3: $subtext0;
    '';

    "eww/eww.scss".text = ''
      * {
        font-family: "Iosevka Nerd Font";
        font-weight: bold;
      }
      window {
        background: transparent;
      }
      @import "styles/colors.scss";
      @import "styles/calendar.scss";
      @import "styles/wallpapers.scss";
    '';
  };
}
