{ lib, config, ... }:

{
  options = {
    gitModule.enable =
      lib.mkEnableOption "enables gitModule";
  };

  config = lib.mkIf config.gitModule.enable {
    programs.git = {
      enable = true;
      userName = "AlxTray";
      userEmail = "alex.ashby02@icloud.com";
    };
  };
}
