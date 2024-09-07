{ inputs, pkgs, lib, config, ... }:

{
  options = {
    flakePackagesModule.enable =
      lib.mkEnableOption "enables flakePackagesModule";
  };

  config = lib.mkIf config.flakePackagesModule.enable {
    home.packages = [
      inputs.pyprland.packages.${pkgs.system}.pyprland
      inputs.swww.packages.${pkgs.system}.swww
      inputs.alxvim.packages.${pkgs.system}.default
    ];
  };
}
