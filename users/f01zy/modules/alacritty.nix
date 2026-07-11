{ ... }: {
  programs.alacritty = {
    enable = true;

    settings = {
      font = {
        normal = {
          family = "Iosevka Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "Iosevka Nerd Font";
          style = "Bold";
        };
        size = 12.0;
      };

      window = {
        opacity = 0.80;
      };
    };
  };
}
