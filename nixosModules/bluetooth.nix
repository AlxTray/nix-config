{ lib, config, ... }:

{
  options = {
    bluetoothModule.enable =
      lib.mkEnableOption "enables bluetoothModule";
  };

  config = lib.mkIf config.bluetoothModule.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    services.blueman.enable = true;
  };
}
