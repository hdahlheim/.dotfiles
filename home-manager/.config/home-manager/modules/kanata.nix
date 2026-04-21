{ config, pkgs, ... }:

{
  home.file.".config/kanata/kanata.kbd".text = ''
    (defcfg
      process-unmapped-keys yes
    )

    (defsrc
      caps
    )

    (deflayer base
      @cap
    )

    (defalias
      cap (tap-hold 200 200 esc lctl)
    )
  '';

  launchd.agents.kanata = {
    enable = true;
    config = {
      Label = "org.local.kanata";
      ProgramArguments = [
        "${config.home.homeDirectory}/.nix-profile/bin/kanata"
        "--cfg"
        "${config.home.homeDirectory}/.config/kanata/kanata.kbd"
      ];
      RunAtLoad = true;
      KeepAlive = true;
      StandardOutPath = "${config.home.homeDirectory}/Library/Logs/kanata.log";
      StandardErrorPath = "${config.home.homeDirectory}/Library/Logs/kanata-error.log";
    };
  };
}
