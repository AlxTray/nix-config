{ lib, config, ... }:

{
  options = {
    imvModule.enable =
      lib.mkEnableOption "enables imvModule";
  };

  config = lib.mkIf config.imvModule.enable {
    programs.imv.enable = true;
  };
}
