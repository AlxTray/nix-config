{ lib, config, ... }:

{
  options = {
    dconfModule.enable =
      lib.mkEnableOption "enables dconfModule";
  };

  config = lib.mkIf config.dconfModule.enable {
    programs.dconf.enable = true;
  };
}
