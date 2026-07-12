{
  description = "Home Manager configuration of pctgx8";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."pctgx8" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ../common-nix-modules/home-manager/base.nix
          ../common-nix-modules/home-manager/neovim.nix
          ../common-nix-modules/home-manager/git.nix
          ../common-nix-modules/home-manager/fish.nix
          ../common-nix-modules/home-manager/zed.nix
          ../common-nix-modules/home-manager/zed.rust.nix
          ./home.nix
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
