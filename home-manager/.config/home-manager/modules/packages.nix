{ pkgs, ... }:

{
  home.packages = with pkgs;
  let
    beam-otp = beam.packages.erlang_28;
  in [
    stow
    scc
    bat
    dnsutils
    jq
    htop
    ripgrep
    sox
    ffmpeg
    #jujutsu
    zsh
    tree
    neovim
    helix
    tmux
    wget
    nmap
    dive
    fastfetch
    git-filter-repo
    git-crypt
    gh
    iftop
    lf
    d2
    #gource
    lazygit
    stripe-cli
    llvm
    #beam-otp.erlang
    #beam-otp.elixir_1_19
    #beam-otp.elixir-ls
    nixd
    nil
    shfmt
    shellcheck
    heroku
    ansible
    esbuild
    postgresql
    btop
    zellij
    k6
    miller
    typos
    harper
    rclone

    nushell
    kanata

    # docs
    pandoc
    #asciidoctor

    # fonts
    ibm-plex
    fira-code
    fira-go
    work-sans

    #yt-dlp
    #mpv
    imagemagick

    #php
    php84
    php84Packages.composer
  ];
}
