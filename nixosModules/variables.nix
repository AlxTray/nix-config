{ lib, config, ... }:

{
  options = {
    variablesModule.enable =
      lib.mkEnableOption "enables variablesModule";
  };

  config = lib.mkIf config.variablesModule.enable {
    environment.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      SUDO_EDITOR = "nvim";
    };
  };
}
