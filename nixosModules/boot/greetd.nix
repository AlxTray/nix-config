{ pkgs, lib, config, ... }:

{
  options = {
    greetdModule.enable =
      lib.mkEnableOption "enables greetdModule";
  };

  config = lib.mkIf config.greetdModule.enable {
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --asterisks";
          user = "greeter";
        };
      };
    };
  };
}
