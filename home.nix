{ pkgs, ... }: {
  home.stateVersion = "25.11";   # set once to the release you start on; don't bump it casually

  home.packages = with pkgs; [ 
    mise 
    starship
  ];

  programs.git = {
    enable = true;
    settings.user.name  = "Doug McNish";
    settings.user.email = "dmcnish@rtctel.com";
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      conf-update = "sudo darwin-rebuild switch --flake $HOME/.config/nix-darwin";
    };

    history.size = 10000;

    initContent = ''
      # enable orbstack commands
      if [ -f ~/.orbstack/shell/init.zsh ]; then
        source ~/.orbstack/shell/init.zsh
      fi
      # enable mise-en-plase
      if command -v mise &> /dev/null; then
        eval "$(mise activate zsh)"
      fi
    '';
    
  };

}
