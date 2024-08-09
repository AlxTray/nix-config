{ lib, config, ... }:

{
  options = {
    firefoxModule.enable =
      lib.mkEnableOption "enables firefoxModule";
  };

  config = lib.mkIf config.firefoxModule.enable {
    programs.firefox = {
      enable = true;
    };
  };
}
