{ pkgs, ... }:
let
  lf-previewer = pkgs.writeShellScript "lf-previewer" ''
    file="$1"
    w="$2"
    h="$3"
    x="$4"
    y="$5"
    case "$(file --mime-type -Lb "$file")" in
      image/*)
        ${pkgs.chafa}/bin/chafa --size "$w"x"$h" --fit-width --symbols sex --color-space rgb "$file"
        exit 1
        ;;
      text/*|application/json)
        ${pkgs.bat}/bin/bat --style=changes --color=always "$file"
        ;;
      *)
        ${pkgs.file}/bin/file -b "$file"
        ;;
    esac
  '';
in
{
  home.packages = with pkgs; [
    chafa
    bat
    file
  ];

  programs.lf = {
    enable = true;
    previewer.source = lf-previewer;

    settings = {
      drawbox = true;
      icons = true;
      ignorecase = true;
      ratios = [
        1
        1
        2
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
  };
}
