{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      name = "CaskaydiaCove Nerd Font Mono";
    };
    settings = {
      shell = "/etc/profiles/per-user/arkannon/bin/bash";
      editor = "nvim";
      background = "#181818";
      confirm_os_window_close = 0;
    };

  };
}
