{ pkgs, ... }:
{
  users.users.arkannon.home = "/Users/arkannon";

  services = {
    nix-daemon.enable = true;
  };

  programs.bash.enable = true;

  nix.settings.experimental-features = "nix-command flakes impure-derivations ca-derivations";

  fonts = {
    fontDir.enable = true;
    fonts = [ pkgs.cascadia-code pkgs.nerdfonts ];
  };

  homebrew = {
    enable = true;
    casks = [
      "firefox"
      "prusaslicer"
      "libreoffice"
      "nextcloud"
      "parsec"
    ];
  };

  environment = {
    loginShell = "/run/current-system/sw/bin/bash";
  };

  security.pam.enableSudoTouchIdAuth = true;

  system = {
    defaults = {
      finder = {
        AppleShowAllFiles = true;
        AppleShowAllExtensions = true;
      };
      NSGlobalDomain = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
      };

    };
  };
}
