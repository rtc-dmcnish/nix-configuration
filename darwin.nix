{ pkgs, ... }: {
  nixpkgs.hostPlatform = "aarch64-darwin";   # "x86_64-darwin" on Intel
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.enable = false;                      # uncomment if using Determinate Nix

  system.primaryUser = "dmcnish";           # required for user-scoped options (defaults, homebrew)
  users.users."dmcnish".home = "/Users/dmcnish";   # home-manager needs this

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [ 
    git 
    vim 
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
  system.stateVersion = 6;
  security.pam.services.sudo_local.touchIdAuth = true;
}
