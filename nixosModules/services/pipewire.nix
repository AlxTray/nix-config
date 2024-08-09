{ lib, config, ... }:

{
  options = {
    pipewireModule.enable =
      lib.mkEnableOption "enables pipewireModule";
  };

  config = lib.mkIf config.pipewireModule.enable {
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
