{ lib, config, ... }:

{
  options = {
    steamModule.enable =
      lib.mkEnableOption "enables steamModule";
  };

  config = lib.mkIf config.steamModule.enable {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };
}
