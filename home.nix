{ pkgs, ... }: {
  home.stateVersion = "25.11";   # set once to the release you start on; don't bump it casually

  home.packages = with pkgs; [ 
    helix 
    bgpq4 
    subnetcalc
    drawio
    thunderbird
    joplin-desktop
    ripgrep 
    jq 
    fd 
    mise 
    starship
    taskwarrior3
    timewarrior
    github-cli 
    coreutils-prefixed
    nerd-fonts.hack 
    bruno 
    inkscape
    librewolf
    keepassxc
    meld
  ];

# Global git configuration
  programs.git = {
    enable = true;
    settings.user.name  = "Doug McNish";
    settings.user.email = "dmcnish@rtctel.com";
  };

# Helix editor configuration
  programs.helix = {
    enable = true;
    settings = 
    {
      editor = {
        line-number = "relative";
        lsp = {
          display-messages = true;
        };
      };
      keys = {
        normal = {
          esc = [
            "collapse_selection"
            "keep_primary_selection"
          ];
          space = {
            q = ":q";
            space = "file_picker";
            w = ":w";
          };
        };
      };
      theme = "nord";
    };
}

# Shell sugar
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

# Taskwarrior configuration
  programs.taskwarrior = {
    enable = true;
    package = pkgs.taskwarrior3;
    config = {
      data.location = "~/.task";
      news.version = "3.5.0";
      sync.local.server_dir="~/Library/Mobile Documents/iCloud~com~mav~taskchamp/Documents/taskchamp";
      dateformat = "Y-M-D";
      report.next = {
        filter =  "+PENDING -BLOCKED -WAITING -hold limit:page";
      }; 
      report.work = {
        description = "Work Tasks"; 
        columns = [ "id" "start" "entry.age" "depends" "priority" "project" "tags" "recur" "scheduled" "due" "until" "description" ];
        labels = [ "ID" "Active" "Age" "Deps" "P" "Project" "Tags" "Recur" "Sched" "Due" "Until" "Description" ];
        sort = [ "priority-" "due+" "project+" "entry+" ];
        filter = "+PENDING -WAITING -hold limit:page -p";
      };
      report.home = {
        description = "Home Tasks"; 
        columns = [ "id" "start" "entry.age" "depends" "priority" "project" "tags" "recur" "scheduled" "due" "until" "description" ];
        labels = [ "ID" "Active" "Age" "Deps" "P" "Project" "Tags" "Recur" "Sched" "Due" "Until" "Description" ];
        sort = [ "priority-" "due+" "project+" "entry+" ];
        filter = "+PENDING -WAITING -hold limit:page +p";
      };
    };
  };

  # Local shell configuration
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    sessionVariables = {
      OBJC_DISABLE_INITIALIZE_FORK_SAFETY = "YES";
    };

    shellAliases = {
      ls = "gls --color=auto --hyperlink=auto";
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

  # Configuration for KiTTY terminal
  home.file.".config/kitty/"= {
    source = ./kitty;
    recursive=true;
  };

}
