{ lib, config, ... }:

{
  options = {
    systemdBootModule.enable =
      lib.mkEnableOption "enables systemdBootModule";
  };

  config = lib.mkIf config.systemdBootModule.enable {
    boot = {
      loader.systemd-boot.enable = true;
      loader.systemd-boot.consoleMode = "max";
    };
  };
}
