{ pkgs, lib, config, ... }:

{
  options = {
    locateModule.enable =
      lib.mkEnableOption "enables locateModule";
  };

  config = lib.mkIf config.locateModule.enable {
    services.locate = {
      enable = true;
      package = pkgs.plocate;
      localuser = null;
    }; 
  };
}
