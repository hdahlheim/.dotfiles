{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }: {
    homeConfigurations."hd" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${builtins.currentSystem};
      modules = [ ./home-manager/.config/home-manager/home.nix ];
    };
  };
}
