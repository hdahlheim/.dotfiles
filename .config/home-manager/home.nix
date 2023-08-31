{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "hd";
  home.homeDirectory = "/Users/hd";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    bat
    jq
    hugo
    htop
    ripgrep
    git
    zsh
    tree
    tldr
    neovim
    fzf
    tmux
    wget
    neofetch
    zoxide
    exa
    bottom
    starship
    rtx
    direnv
    wireguard-tools
    git-crypt
    devbox
    hurl
    gh
    colima
    docker-client
    nixpacks
    iftop
    lf
    nix-your-shell
    zls
    #elixir
    beam.packages.erlangR26.elixir_1_15
    go_1_21

    # fonts
    ibm-plex
    fira-code
    fira-go
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    
    # disable tty login msg
    ".hushlogin".text = '''';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/hd/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
     EDITOR = "nvim";
     BAT_THEME="ansi";
     LANG="en_US.UTF-8";
     LC_ALL="en_US.UTF-8";
  };

  programs.zsh = {
    enable = true;
    autocd = true;
    profileExtra = "
    source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
    if command -v nix-your-shell > /dev/null; then
      nix-your-shell zsh | source /dev/stdin
    fi
    ";
    antidote = {
      enable = true;
      plugins = [
        "zsh-users/zsh-autosuggestions"
        "zdharma/fast-syntax-highlighting"
        "joshskidmore/zsh-fzf-history-search"
        "zsh-users/zsh-completions"
      ];
    };
    enableAutosuggestions = true;
    shellAliases = {
      ll = "exa -abl --group-directories-first";
      ls = "exa";
      vi = "nvim";
      vim = "nvim";
      hms = "home-manager switch";
      hme = "home-manager edit";
      update = "nix-channel --update && home-manager switch";
      dot = "/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME";
      netq = "networkquality";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    dirHashes = {
      dev = "$HOME/Developer";
      hdgit = "$HOME/Developer/github.com/hdahlheim";
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      command_timeout = 1000;
      add_newline = false;
      hostname = {
        ssh_only = false;
      };
      username = {
        show_always = true;
        format = "[$user]($style)@";
      };
      character = {
        success_symbol = "[>](bold green)";
        error_symbol = "[x](bold red)";
        vimcmd_symbol = "[<](bold green)";
      };
      git_commit = {
        tag_symbol = " tag ";
      };
      git_status = {
        ahead = ">";
        behind = "<";
        diverged = "<>";
        renamed = "r";
        deleted = "x";
      };
      golang = {
        symbol = "go ";
      };
      rust = {
        symbol = "rust ";
      };
      deno = {
        symbol = "deno ";
      };
      nodejs = {
        # disabled = true;
        symbol = "node.js ";
      };
      elixir = {
        symbol = "elixir ";
      };
      erlang = {
        symbol = "erlang ";
      };
      nix_shell = {
       symbol = "";
      };
      package = {
        disabled = true;
        symbol = "pkg ";
      };
      php = {
        symbol = "php ";
      };
      directory = {
        read_only = " ro";
      };
    };
  };

  programs.fzf.enable = true;

  programs.git = {
    enable = true;
    userName = "Henning Dahlheim";
    userEmail = "dev@dahlheim.ch";
    lfs = { enable = true; };
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.rtx = {
    enable = true;
    settings = {
      settings = {
        asdf_compat = true;
        verbose = false;
      };
    };
  };

  programs.direnv = {
    enable = true;
  };

  programs.direnv.nix-direnv.enable = true;
  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  targets.darwin.defaults = {
    "com.apple.dock" = {
      tilesize = 26;
    };

    "com.apple.Safari" = {
      IncludeDevelopMenu = true;
      AutoFillPasswords = false;
      AutoOpenSafeDownloads = false;
      ShowOverlayStatusBar = true;
    };
  };
}
