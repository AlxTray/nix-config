{ lib, config, ... }:

{
  options = {
    ncspotModule.enable =
      lib.mkEnableOption "enables ncspotModule";
  };

  config = lib.mkIf config.ncspotModule.enable {
    programs.ncspot = {
      enable = true;
      settings = {
        use_nerdfont = true;
      };
    };
  };
}
