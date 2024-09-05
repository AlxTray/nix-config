{ lib, config, ... }:

{
  config = lib.mkIf config.hyprlandHomeModule.enable {
    services.hypridle = {
      enable = true;
      settings = {
        general = {
          ignore_dbus_inhibit = false;
          lock_cmd = "hyprlock";
        };
        listener = [
          {
            timeout = 900;
            on-timeout = "hyprlock";
          }
        ];
      };
    };
  };
}
