{ lib, config, ... }:

{
  options = {
    direnvModule.enable =
      lib.mkEnableOption "enables direnvModule";
  };

  config = lib.mkIf config.direnvModule.enable {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableZshIntegration = true;
    };
  };
}
