{ lib, config, ... }:

{
  options = {
    plymouthModule.enable =
      lib.mkEnableOption "enables plymouthModule";
  };

  config = lib.mkIf config.plymouthModule.enable {
    boot.plymouth.enable = true;
  };
}
