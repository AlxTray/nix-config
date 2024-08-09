{ lib, config, ... }:

{
  options = {
    rtkitModule.enable =
      lib.mkEnableOption "enables rtkitModule";
  };

  config = lib.mkIf config.rtkitModule.enable {
    security.rtkit.enable = true;
  };
}
