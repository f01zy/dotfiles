{ ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "alanpeabody";
    };

    shellAliases = {
      se = "sudoedit";
      ll = "ls -l";
      la = "ls -la";
      nrs = "sudo nixos-rebuild switch --flake /etc/nixos/#nixos";
      cb = "cmake --build . -j 4";
    };
  };
}
