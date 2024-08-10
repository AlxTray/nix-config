{ lib, config, ... }:

{
  options = {
    dockerModule.enable =
      lib.mkEnableOption "enables dockerModule";
  };

  config = lib.mkIf config.dockerModule.enable {
    virtualisation.docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
      daemon.settings = {
        userland-proxy = false;
      };
    };
  };
}
