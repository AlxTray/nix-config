{ pkgs, lib, config, ... }:

{
  options = {
    portalsModule.enable =
      lib.mkEnableOption "enables portalsModule";
  };

  config = lib.mkIf config.portalsModule.enable {
    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
  };
}
