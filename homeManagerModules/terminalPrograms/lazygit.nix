{ lib, config, ... }:

{
  options = {
    lazygitModule.enable =
      lib.mkEnableOption "enables lazygitModule";
  };

  config = lib.mkIf config.lazygitModule.enable {
    programs.lazygit.enable = true;
  };
}
