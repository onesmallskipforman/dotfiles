# https://www.reddit.com/r/NixOS/comments/1felrey/keeping_separate_home_manager_configurations/
{
  description = "Home Manager configuration of skipper";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mic92.url = "github:Mic92/nur-packages";
    # userChrome.url = "path:userChrome.css";
    # userContent.url = "path:userContent.css";
  };

  outputs = { nixpkgs, home-manager, mic92, nur,
    # userChrome, userContent,
    ... }@flake_inputs:
    let
      system = "x86_64-linux";
      # pkgs = nixpkgs.legacyPackages.${system}
      # nur_pkgs = nur.legacyPackages.${system};
      # mic92_pkgs = mic92.packages.${system};
      # pkgs = nixpkgs.legacyPackages.${system} // mic92.packages.${system};
      pkgs = nixpkgs.legacyPackages.${system} // nur.legacyPackages.${system};
    in {
      homeConfigurations."skipper" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
        extraSpecialArgs = {
          # NOTE: this is needed when pkgs combines both nur and nixpkgs
          inherit pkgs;
          # inherit userChrome;
          # inherit userContent;
          # inherit nur_pkgs;
        };
      };
    };
}
