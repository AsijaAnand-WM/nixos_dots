{
	description = "Nixos Flake Config Of 19th";

	inputs = {
		nixpkgs.url = "github:NixOs/nixpkgs/nixos-26.05";
		nixpkgs-unstable.url = "github:NixOs/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager/release-26.05";
			inputs.nixpkgs.follows = "nixpkgs";		
		};

        zen-browser = {
            url = "github:youwen5/zen-browser-flake";
            inputs.nixpkgs.follows = "nixpkgs";
        };
	};

	outputs = { 
        nixpkgs, 
        nixpkgs-unstable, 
        home-manager, 
        zen-browser, 
        ... 
        }:
    let
		system = "x86_64-linux";
		unstable = nixpkgs-unstable.legacyPackages.${system};
    in {
		nixosConfigurations.neunzehnte = nixpkgs.lib.nixosSystem {
            inherit system;
			modules = [
				./configuration.nix

				home-manager.nixosModules.home-manager {
					home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						users."_19" = import ./home.nix;
						backupFileExtension = "backup";
						extraSpecialArgs = { inherit unstable zen-browser; };
					};
				}
			];
		};
	};
}
