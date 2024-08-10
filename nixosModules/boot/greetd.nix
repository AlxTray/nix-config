{ username, pkgs, lib, config, ... }:

{
  options = {
    greetdModule.enable =
      lib.mkEnableOption "enables greetdModule";
  };

  config = lib.mkIf config.greetdModule.enable {
    services.greetd = {
      enable = true;
      vt = 3;
      settings = {
        default_session = {
          user = username;
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        };
      };
    };
  };
}
