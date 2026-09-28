{...}: {

  home.file.".hammerspoon/" = {
    source = ../dotfiles/hammerspoon;
    recursive = true;
  };

  # Configuration for KiTTY terminal
  home.file.".config/kitty/"= {
    source = ../dotfiles/kitty;
    recursive = true;
  };

}
