{ lib, config, ... }:

{
  options = {
    plymouthModule.enable =
      lib.mkEnableOption "enables plymouthModule";
  };

  config = lib.mkIf config.plymouthModule.enable {
    boot = {
      consoleLogLevel = 3;
      kernelParams = [
        "quiet"
        "splash"
        "rd.systemd.show_status=false"
        "rd.udev.log_level=3"
        "udev.log_priority=3"
      ];
      plymouth.enable = true;
    };
  };
}
