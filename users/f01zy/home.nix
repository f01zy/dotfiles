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
    ./modules/mpd.nix
    ./modules/ncmpcpp.nix
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
    (import ./scripts/menu.nix { inherit pkgs; })
    (import ./scripts/off.nix { inherit pkgs; })

    # Inputs (Flakes)
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

    # Programs
    discord
    spotify
    bluetui
    obsidian
    telegram-desktop
    timewarrior
    obs-studio
    crow-translate

    # Development & Build Tools
    mosh
    cmake
    gcc
    git
    gnumake
    nixfmt
    unzip
    wakatime-cli
    gdb
    gdb-dashboard
    nasm
    binutils

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
