{ lib, config, ... }:

{
  options = {
    udiskieModule.enable =
      lib.mkEnableOption "enables udiskieModule";
  };

  config = lib.mkIf config.udiskieModule.enable {
    services.udiskie = {
      enable = true;
      tray = "never";
    };
  };
}
