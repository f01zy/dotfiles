{ pkgs, inputs, ... }: {
  home.username = "f01zy";
  home.homeDirectory = "/home/f01zy";
  home.stateVersion = "26.05";

  # Modules
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./modules/alacritty.nix
    ./modules/zsh.nix
    ./modules/mpd.nix
    ./modules/ncmpcpp.nix
    ./modules/fastfetch.nix
    ./modules/nixvim.nix
    ./modules/sway.nix
    ./modules/waybar.nix
    ./modules/mako.nix
    ./modules/lf.nix
    ./modules/zathura.nix
    ./modules/gnupg.nix
  ];

  # Default programs
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = "lf.desktop";
      "text/html" = "zen.desktop";
      "x-scheme-handler/http" = "zen.desktop";
      "x-scheme-handler/https" = "zen.desktop";
      "x-scheme-handler/about" = "zen.desktop";
      "x-scheme-handler/unknown" = "zen.desktop";
    };
  };

  xdg.desktopEntries.lf = {
    name = "lf";
    genericName = "File Manager";
    exec = "alacritty -e lf %u";
    terminal = true;
    categories = [
      "Utility"
      "FileManager"
      "ConsoleOnly"
    ];
    mimeType = [ "inode/directory" ];
  };

  # Themming
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 18;
  };

  home.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "18";
  };

  # Packages
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # Scripts
    (import ./scripts/wallpaper.nix { inherit pkgs; })

    # Inputs (Flakes)
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

    # Programs
    spotify
    bluetui
    obsidian
    telegram-desktop
    timewarrior
    wmenu

    # Development & Build Tools
    cmake
    gcc
    git
    gnumake
    nixfmt
    unzip
    wakatime-cli

    # System & Media Utils
    awww
    ripgrep
    imv
    mpv
    grim
    mpc
    nerd-fonts.iosevka
    pulseaudio
    slurp
  ];
}
