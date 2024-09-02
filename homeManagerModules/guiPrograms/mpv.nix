{ pkgs, lib, config, ... }:

{
  options = {
    mpvModule.enable =
      lib.mkEnableOption "enables mpvModule";
  };

  config = lib.mkIf config.mpvModule.enable {
    programs.mpv = {
      enable = true;
      defaultProfiles = [ "gpu-hq" ];
      scripts = with pkgs; [
        mpvScripts.mpris
        mpvScripts.modernx-zydezu
        mpvScripts.thumbfast
      ];
    };
  };
}
