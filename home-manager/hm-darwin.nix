{ config, pkgs, ... }: {
    programs.zsh.sessionVariables = {
        OBJC_DISABLE_INITIALIZE_FORK_SAFETY = "YES";
    };
    shellAliases = {
      conf-update = "sudo darwin-rebuild switch --flake $HOME/.config/nix-darwin#\$(hostname)";
      ls = "gls --color=auto --hyperlink=auto";
    };
    imports = [
        ./default.nix
    ];
}
