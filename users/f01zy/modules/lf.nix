{ pkgs, ... }: {
  programs.lf = {
    enable = true;

    settings = {
      drawbox = true;
      icons = true;
      ignorecase = true;
      ratios = [
        2
        2
        3
      ];
    };

    commands = {
      mkdir = ''%mkdir -p "$@"'';
      touch = ''%touch "$@"'';
    };

    keybindings = {
      "V" = "''${pkgs.bat}/bin/bat";
      "md" = "push :mkdir<space>";
      "mf" = "push :touch<space>";
      "o" = "open";
    };

    extraConfig = ''
      set colors 'bg:#1e1e2e:fg:#cdd6f4:*.tw=#b4befe:*.dir=#74c7ec:*.zip=#89dceb'
    '';
  };
}
