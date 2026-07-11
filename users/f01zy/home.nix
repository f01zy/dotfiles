{ pkgs, inputs, ... }: {
  home.username = "f01zy";
  home.homeDirectory = "/home/f01zy";
  home.stateVersion = "26.05";

  # Modules
  imports = [
    inputs.nixvim.homeModules.nixvim
    inputs.catppuccin.homeModules.catppuccin

    ./modules/nixvim/main.nix
    ./modules/eww/main.nix
    ./modules/alacritty.nix
    ./modules/zsh.nix
    ./modules/ncspot.nix
    ./modules/fastfetch.nix
    ./modules/sway.nix
    ./modules/waybar.nix
    ./modules/mako.nix
    ./modules/lf.nix
    ./modules/zathura.nix
    ./modules/gnupg.nix
    ./modules/mime.nix
    ./modules/zen.nix
    ./modules/swaylock.nix
    ./modules/swayidle.nix
    ./modules/rofi.nix
    ./modules/tmux.nix
    ./modules/git.nix
    ./modules/catppuccin.nix
    ./modules/cursor.nix
  ];

  # Packages
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # Scripts
    (import ./scripts/wallpaper.nix { inherit pkgs; })
    (import ./scripts/now-playing.nix { inherit pkgs; })
    (import ./scripts/widget-popup.nix { inherit pkgs; })
    (import ./scripts/calendar-generate.nix { inherit pkgs; })

    # Inputs
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

    # Programs
    discord
    telegram-desktop
    obsidian
    obs-studio
    timewarrior
    qalculate-gtk

    # Development & Build Tools
    mosh
    cmake
    gnumake
    gcc
    unzip
    nixfmt
    gdb
    wakatime-cli

    # System & Media Utils
    nerd-fonts.iosevka
    papirus-icon-theme
    ripgrep
    playerctl
    imv
    mpv
    bat
    awww
    grim
    slurp
  ];
}
