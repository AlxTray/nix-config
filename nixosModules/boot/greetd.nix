{ username, lib, config, ... }:

{
  options = {
    greetdModule.enable =
      lib.mkEnableOption "enables greetdModule";
  };

  config = lib.mkIf config.greetdModule.enable {
    services.greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          user = username;
          command = "Hyprland";
        };
        default_session = initial_session;
      };
    };
  };
}
