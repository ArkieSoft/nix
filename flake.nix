{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    darwin-custom-icons.url = "github:ryanccn/nix-darwin-custom-icons";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, darwin-custom-icons }:
    with inputs;
    let
      specialArgs = { inherit inputs self; };
      systems = [ "x86_64-linux" "aarch64-darwin" ];
      eachSystem = inputs.nixpkgs.lib.genAttrs systems;
    in
    {
      darwinConfigurations."arkmac" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./configuration.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.arkannon = import ./home.nix;
            home-manager.extraSpecialArgs = specialArgs;
          }
          darwin-custom-icons.darwinModules.default
        ];
      };
      formatter = eachSystem (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        pkgs.nixpkgs-fmt
      );
    };
}
