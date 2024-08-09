{ lib, config, ... }:

{
  options = {
    polkitModule.enable =
      lib.mkEnableOption "enables polkitModule";
  };

  config = lib.mkIf config.polkitModule.enable {
    security.polkit.enable = true;
  };
}
