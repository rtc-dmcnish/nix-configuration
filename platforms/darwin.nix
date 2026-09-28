{ pkgs, ... }: {
  nixpkgs.hostPlatform = "aarch64-darwin";   # "x86_64-darwin" on Intel
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.enable = false;                      # uncomment if using Determinate Nix

  programs.zsh = {
    enable = true;
    shellAliases = {
      conf-update = "sudo darwin-rebuild switch --flake $HOME/.config/nix-darwin#\$(hostname)";
      ls = "gls --color=auto --hyperlink=auto";
    };
    sessionVariables = {
      OBJC_DISABLE_INITIALIZE_FORK_SAFETY = "YES";
    };
  };

  environment.systemPackages = with pkgs; [ 
    git 
    vim
    coreutils-prefixed
  ];

  homebrew = {
    enable = true;
    enableZshIntegration = true;
    onActivation.cleanup = "uninstall";
    taps = [
      {
       name = "d12frosted/emacs-plus";
       trusted = true;
      }
    ];
    brews = [];
    casks = [
      "signal"
      "1password-cli"
      "copilot-cli"
      "kitty"
      "emacs-plus-app"
      "fluor"
      "visual-studio-code"
      "marta"
      "basictex"
      "fluor"
      "viscosity"
      "hammerspoon"
    ];
  };

  system.defaults.dock.autohide = false;      # example macOS default
  system.defaults.screencapture.target = "clipboard";
  system.defaults.NSGlobalDomain.AppleShowAllFiles = false;
  system.defaults.finder.AppleShowAllExtensions = true; 
  system.defaults.dock.orientation = "left";
  system.stateVersion = 7;
  security.pam.services.sudo_local.touchIdAuth = true;
}
