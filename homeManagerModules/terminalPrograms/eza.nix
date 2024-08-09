{ lib, config, ... }:

{
  options = {
    ezaModule.enable =
      lib.mkEnableOption "enables ezaModule";
  };

  config = lib.mkIf config.ezaModule.enable {
    programs.eza = {
      enable = true;
      enableZshIntegration = true;
      git = true;
      icons = true;
    };
  };
}
