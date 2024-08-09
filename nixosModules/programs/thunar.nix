{ pkgs, lib, config, ... }:

{
  options = {
    thunarModule.enable =
      lib.mkEnableOption "enables thunarModule";
  };

  config = lib.mkIf config.thunarModule.enable {
    programs.thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
      ];
    };
    services.gvfs.enable = true;
  };
}
