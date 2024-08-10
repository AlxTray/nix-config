{ lib, config, ... }:

{
  options = {
    hyprpaperModule.enable =
      lib.mkEnableOption "enables hyprpaperModule";
  };

  config = lib.mkIf config.hyprpaperModule.enable {
    stylix.targets.hyprland.hyprpaper.enable = false;
    services.hyprpaper.enable = true;
  };
}
