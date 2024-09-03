{ pkgs, lib, config, ... }:

{
  options = {
    dunstModule.enable =
      lib.mkEnableOption "enables dunstModule";
  };

  config = lib.mkIf config.dunstModule.enable {
    stylix.targets.dunst.enable = false;
    services.dunst = {
      enable = true;
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
      settings = {
        global = {
          font = "Inter 10";
          follow = "mouse";
          origin = "top-right";
          offset = "10x10";
          icon_corner_radius = 10;
          corner_radius = 10;

          background = "#${config.stylix.base16Scheme.base00}EB";
          foreground = "#${config.stylix.base16Scheme.base07}";
          frame_color = "#131617";       
        };
      };
    };
  };
}
