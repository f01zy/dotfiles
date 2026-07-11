{ pkgs, inputs, ... }: {
  home.username = "f01zy";
  home.homeDirectory = "/home/f01zy";
  home.stateVersion = "26.05";

  # Modules
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./modules/nixvim/main.nix
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
    ./modules/themes.nix
    ./modules/mime.nix
    ./modules/zen.nix
    ./modules/swaylock.nix
    ./modules/swayidle.nix
    ./modules/rofi.nix
    ./modules/tmux.nix
  ];

  # Packages
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # Scripts
    (import ./scripts/wallpaper.nix { inherit pkgs; })
    (import ./scripts/now-playing.nix { inherit pkgs; })

    # Inputs (Flakes)
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

    # Programs
    discord
    telegram-desktop
    spotify
    obsidian
    obs-studio
    timewarrior

    # Development & Build Tools
    mosh
    cmake
    gnumake
    binutils
    nasm
    gcc
    git
    unzip
    nixfmt
    gdb
    gdb-dashboard
    wakatime-cli

    # System & Media Utils
    nerd-fonts.iosevka
    papirus-icon-theme
    awww
    ripgrep
    imv
    mpv
    playerctl
    grim
    pulseaudio
    slurp
  ];
}
