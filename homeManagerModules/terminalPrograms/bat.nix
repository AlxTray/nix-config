{ lib, config, ... }:

{
  options = {
    batModule.enable =
      lib.mkEnableOption "enables batModule";
  };

  config = lib.mkIf config.batModule.enable {
    programs.bat.enable = true;
  };
}
