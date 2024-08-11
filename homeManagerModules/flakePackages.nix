{ inputs, pkgs, lib, config, ... }:

{
  options = {
    flakePackagesModule.enable =
      lib.mkEnableOption "enables flakePackagesModule";
  };

  config = lib.mkIf config.flakePackagesModule.enable {
    home.packages = [
      inputs.pyprland.packages.${pkgs.system}.pyprland
      inputs.nixvim.packages.${pkgs.system}.default
    ];
  };
}
