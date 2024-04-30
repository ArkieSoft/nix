{ pkgs, ... }: {

  imports = [ ./kitty.nix ./bash.nix ];

  home = {
    stateVersion = "23.11";
    packages = with pkgs; [
      neovim
      git
      gomuks
      gh
      neofetch
      oh-my-posh
      btop
      luajit
      ranger
      go
      tree-sitter
      nix-init
      p7zip
      rustup
      (callPackage ./vesktop-darwin.nix { })
    ];

  };
  programs = {
    zoxide = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
