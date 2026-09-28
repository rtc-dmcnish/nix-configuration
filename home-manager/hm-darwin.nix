{ config, pkgs, ... }: {
    programs.zsh.sessionVariables = {
        OBJC_DISABLE_INITIALIZE_FORK_SAFETY = "YES";
    };
    imports = [
        ./default.nix
    ];
}