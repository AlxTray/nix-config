{ lib, config, ... }:

{
  options = {
    avahiModule.enable =
      lib.mkEnableOption "enables avahiModule";
  };

  config = lib.mkIf config.avahiModule.enable {
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
