{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: {
    nixosConfigurations = {
      wsl = let
        system = "x86_64-linux";
	pkgs = import inputs.nixpkgs {
	  inherit system;
	};
      in inputs.nixpkgs.lib.nixosSystem {
        inherit system pkgs;

        specialArgs = {
          nixpkgs = inputs.nixpkgs;
        };
        modules = [
          inputs.nixos-wsl.nixosModules.wsl
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
          }
          ./configuration.wsl.nix
        ];
      };
    };
  };
}
