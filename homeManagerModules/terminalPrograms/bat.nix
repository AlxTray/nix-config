{ lib, config, ... }:

{
  options = {
    batModule.enable =
      lib.mkEnableOption "enables batModule";
  };

  config = lib.mkIf config.batModule.enable {
    home.sessionVariables = {
      MANPAGER = "sh -c 'bat -l man -p'";
    };
    programs.bat = {
      enable = true;
      config.pager = "less -FR";
    };
  };
}
