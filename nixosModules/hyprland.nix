{ inputs, pkgs, lib, config, ... }:

{
  options = {
    hyprlandSystemModule.enable =
      lib.mkEnableOption "enables hyprlandSystemModule";
  };

  config = lib.mkIf config.hyprlandSystemModule.enable {
    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
    };
  };
}
