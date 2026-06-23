{ ... }: {
  services.mako = {
    enable = true;
    settings = {
      actions = true;
      anchor = "top-right";
      background-color = "#1e1e2ecc";
      border-color = "#b4befe";
      border-radius = 8;
      default-timeout = 4000;
      font = "Iosevka Nerd Font 11";
      height = 100;
      icons = true;
      ignore-timeout = false;
      layer = "top";
      margin = 10;
      markup = true;
      width = 400;
    };
  };
}
