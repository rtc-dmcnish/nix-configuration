{ pkgs, ... }: {
  nixpkgs.hostPlatform = "aarch64-darwin";   # "x86_64-darwin" on Intel
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.enable = false;                      # uncomment if using Determinate Nix

  system.primaryUser = "dmcnish";           # required for user-scoped options (defaults, homebrew)
  users.users."dmcnish".home = "/Users/dmcnish";   # home-manager needs this

  programs.zsh.enable = true;
  environment.systemPackages = with pkgs; [ git vim ];

  system.defaults.dock.autohide = true;      # example macOS default

  system.stateVersion = 6;
  security.pam.enableSudoTouchIdAuth = true; 
}
