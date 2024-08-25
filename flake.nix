{
  description = "ZaneyOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    pyprland.url = "github:hyprland-community/pyprland";
    walker.url = "github:abenz1267/walker";
    stylix.url = "github:trueNAHO/stylix/hyprland-add-hyprpaper-enable-option";
    yazi.url = "github:sxyazi/yazi";
    swww.url = "github:LGFae/swww";
    alxvim.url = "github:AlxTray/alxvim";
  };

  outputs =
    { nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      host = "alxputer";
      username = "alx";
    in
    {
      nixosConfigurations = {
        "${host}" = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit system inputs username host;
          };
          modules = [
            ./hosts/${host}/config.nix
            ./nixosModules

            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = {
                inherit system inputs username host;
              };

              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";

              home-manager.users."${username}" = {
                imports = [
                  ./hosts/${host}/home.nix
                  ./homeManagerModules
                ];
              };
            }
          ];
        };
      };
    };
}
