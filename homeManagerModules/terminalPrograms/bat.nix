{ lib, config, ... }:

{
  options = {
    batModule.enable =
      lib.mkEnableOption "enables batModule";
  };

  config = lib.mkIf config.batModule.enable {
    home.sessionVariables = {
      MANPAGER = "sh -c 'col -bx | bat -l man -p'";
      MANROFOPT = "-c";
    };
    programs.bat = {
      enable = true;
      config.pager = "less -FR";
    };
  };
}
