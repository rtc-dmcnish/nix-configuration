{pkgs,...}:
{
  # Shell sugar
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  # Local shell configuration
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;


#     shellAliases = {};

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
