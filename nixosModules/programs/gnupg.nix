{ lib, config, ... }:

{
  options = {
    gnupgModule.enable =
      lib.mkEnableOption "enables gnupgModule";
  };

  config = lib.mkIf config.gnupgModule.enable {
    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
