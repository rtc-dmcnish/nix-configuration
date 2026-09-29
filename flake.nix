{
  description = "system config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-stable.url = "github:NixOS/nixpkgs/nixos-26.05";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nix-stable, nix-darwin, home-manager, ... }@inputs: {
    darwinConfigurations."HAL69420" = nix-darwin.lib.darwinSystem {
      modules = [
        ./hosts/HAL69420.nix
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "hm-backup";
          home-manager.users.dmcnish = import ./home-manager/hm-darwin.nix;
        }
      ];
    };

    nixosConfigurations."delrey" = nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/delrey.nix
        ./platforms/ad-computer.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "hm-backup";
          home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.users.dag = import ./home-manager/default.nix;
          #home-manager.users."dmcnish@rtctel.com" = import ./home-manager/default.nix;
        }
      ];
    };
  };
}
