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
}
