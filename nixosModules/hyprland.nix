{ lib, config, ... }:

{
  options = {
    hyprlandSystemModule.enable =
      lib.mkEnableOption "enables hyprlandSystemModule";
  };

  config = lib.mkIf config.hyprlandSystemModule.enable {
    programs.hyprland.enable = true;
  };
}
