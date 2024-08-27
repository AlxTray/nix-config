{ pkgs, lib, config, ... }:

{
  options = {
    keyringModule.enable =
      lib.mkEnableOption "enables keyringModule";
  };

  config = lib.mkIf config.keyringModule.enable {
    services.gnome.gnome-keyring.enable = true;
    programs.seahorse.enable = true;
    environment.systemPackages = [ pkgs.libsecret ];
    security.pam.services.greetd.enableGnomeKeyring = true;
  };
}
