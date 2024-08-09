{ lib, config, ... }:

{
  options = {
    xdgModule.enable =
      lib.mkEnableOption "enables xdgModule";
  };

  config = lib.mkIf config.xdgModule.enable {
    xdg = {
      userDirs = {
        enable = true;
        createDirectories = true;
      };
    };
  };
}
