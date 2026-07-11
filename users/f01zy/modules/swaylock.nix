{ pkgs, ... }: {
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;

    settings = {
      screenshots = false;
      clock = true;
      indicator = true;
      indicator-radius = 100;
      fade-in = 0.2;
    };
  };
}
