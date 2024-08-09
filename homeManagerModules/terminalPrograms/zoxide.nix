{ lib, config, ... }:

{
  options = {
    zoxideModule.enable =
      lib.mkEnableOption "enables zoxideModule";
  };

  config = lib.mkIf config.zoxideModule.enable {
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
