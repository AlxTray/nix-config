{ pkgs, lib, config, ... }:

{
  options = {
    steamModule.enable =
      lib.mkEnableOption "enables steamModule";
  };

  config = lib.mkIf config.steamModule.enable {
    programs.gamescope = {
      enable = true;
      capSysNice = true;
    };
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      extraCompatPackages = [
        pkgs.proton-ge-bin
      ];
    };
  };
}
