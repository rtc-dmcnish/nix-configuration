{...}: {
    home.stateVersion = "26.11";   # set once to the release you start on; don't bump it casually
    imports = [
      ./git.nix
      ./user-packages.nix
      ./helix.nix
      ./zsh.nix
      ./dotfiles.nix
      ./taskwarrior.nix
    ];
}
