{ config, ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    profileExtra = "
    source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
    bindkey -e
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
    autosuggestion = {
      enable = true;
    };
    shellAliases = {
      ll = "eza -abl";
      ls = "eza";
      vi = "nvim";
      vim = "nvim";
      update = "nix flake update --flake ~/.dotfiles && hms";
      upgrade = "sudo -i sh -c 'nix upgrade-nix'";
      netq = "networkquality";
      flushdns = "sudo killall -HUP mDNSResponder";
    };
    initExtra = ''
      # Edit a home-manager module; fzf-select from .nix files in the config tree
      hme() {
        local dir="$HOME/.dotfiles/home-manager/.config/home-manager"
        local file
        file=$(find "$dir" -name "*.nix" | sed "s|$dir/||" | sort | fzf --prompt="module > ") || return
        [[ -n "$file" ]] && $EDITOR "$dir/$file"
      }

      # Switch home-manager config; defaults to the current hostname
      hms() {
        local config="''${1:-$(hostname -s)}"
        home-manager switch --flake ~/.dotfiles#"$config"
      }
    '';
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    dirHashes = {
      dev = "$HOME/Developer";
      hdgit = "$HOME/Developer/github.com/hdahlheim";
      republik = "$HOME/Developer/github.com/republik";
    };
  };

  programs.eza = {
    enable = true;
    icons = "never";
    git = true;
    extraOptions = [ "--group-directories-first" ];
  };

  programs.starship = {
    enable = true;
    settings = {
      command_timeout = 1500;
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

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [
      "--cmd zd"
    ];
  };

  programs.fzf.enable = true;
  #programs.atuin.enable = true;
  programs.nix-your-shell.enable = true;
}
