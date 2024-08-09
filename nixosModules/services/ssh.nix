{ lib, config, ... }:

{
  options = {
    sshModule.enable =
      lib.mkEnableOption "enables sshModule";
  };

  config = lib.mkIf config.sshModule.enable {
    services.openssh.enable = true;
  };
}
