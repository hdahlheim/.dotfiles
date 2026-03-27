{ ... }:

{
  targets.darwin.defaults = {
    "com.apple.dock" = {
      tilesize = 26;
      slow-motion-allowed = true;
    };

    "com.apple.Safari" = {
      IncludeDevelopMenu = true;
      AutoFillPasswords = false;
      AutoOpenSafeDownloads = false;
      ShowOverlayStatusBar = true;
    };

    "com.microsoft.VSCode" = {
      ApplePressAndHoldEnabled = false;
    };

    "dev.zed.Zed" = {
      ApplePressAndHoldEnabled = false;
    };
  };
}
