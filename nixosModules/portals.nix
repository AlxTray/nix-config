{ pkgs, lib, config, ... }:

{
  options = {
    portalsModule.enable =
      lib.mkEnableOption "enables portalsModule";
  };

  config = lib.mkIf config.portalsModule.enable {
    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      config = {
        common.default = [ "gtk" ];
        hyprland.default = [ "gtk" "hyprland" ];
      };
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
  };
}
