{ lib, config, ... }:

{
  options = {
    gitModule.enable =
      lib.mkEnableOption "enables gitModule";
  };

  config = lib.mkIf config.gitModule.enable {
    home.sessionVariables.DELTA_PAGER = "less -R";
    programs.git = {
      enable = true;
      delta = {
        enable = true;
        options.dark = true;
      };
      extraConfig = {
        diff.colorMoved = "default";
        merge.conflictstyle = "diff3";
      };
      userName = "AlxTray";
      userEmail = "alex.ashby02@icloud.com";
    };
  };
}
