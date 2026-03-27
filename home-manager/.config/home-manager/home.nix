{ config, pkgs, ... }:

{
  imports = [
    ./modules/packages.nix
    ./modules/shell.nix
    ./modules/git.nix
    ./modules/macos.nix
  ];

  home.username = "hd";
  home.homeDirectory = "/Users/hd";

  # Do not change without reading the Home Manager release notes.
  home.stateVersion = "23.05";

  home.file = {
    # Disable tty login message
    ".hushlogin".text = "";
    ".ssh/allowed_signers".text =
      "* ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMVLR8sXRSwyACnuUH4nz2sMGN8ScDXJ6MlhakambwHW hackbook";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    BAT_THEME = "ansi";
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    ERL_AFLAGS = "-kernel shell_history enabled";
    MIX_OS_DEPS_COMPILE_PARTITION_COUNT = "$(($(sysctl -n hw.physicalcpu) / 2))";
  };

  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/.config/composer/vendor/bin"
  ];

  programs.home-manager.enable = true;
}
