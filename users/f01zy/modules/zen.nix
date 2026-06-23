let
  path = ".config/zen/i1by4tlm.Default Profile/chrome";
in
{ ... }: {
  home.file = {
    "${path}/userChrome.css".source = ../dotfiles/zen/userChrome.css;
    "${path}/userContent.css".source = ../dotfiles/zen/userContent.css;
    "${path}/zen-logo.svg".source = ../dotfiles/zen/zen-logo.svg;
  };
}
