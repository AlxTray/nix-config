{ pkgs, lib, config, ... }:

{
  options = {
    portalsModule.enable =
      lib.mkEnableOption "enables portalsModule";
  };

  config = lib.mkIf config.portalsModule.enable {
    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal
      ];
      configPackages = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-hyprland
        pkgs.xdg-desktop-portal
      ];
    };
  };
}
