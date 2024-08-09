{ lib, config, ... }:

{
  options = {
    qtModule.enable =
      lib.mkEnableOption "enables qtModule";
  };

  config = lib.mkIf config.qtModule.enable {
    qt.enable = true;
  };
}
