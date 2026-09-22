{ pkgs, ... }: {
  home.stateVersion = "25.11";   # set once to the release you start on; don't bump it casually

  home.packages = with pkgs; [ ripgrep jq fd ];

  programs.git = {
    enable = true;
    settings.user.name  = "Doug McNish";
    settings.user.email = "dmcnish@rtctel.com";
  };

  programs.zsh.enable = true;
}
