{ lib, config, ... }:

{
  options = {
    efiModule.enable =
      lib.mkEnableOption "enables efiModule";
  };

  config = lib.mkIf config.efiModule.enable {
    boot.loader.efi.canTouchEfiVariables = true;
  };
}
