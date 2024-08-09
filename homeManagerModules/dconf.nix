{ lib, config, ... }:

{
  options = {
    dconfSettingsModule.enable =
      lib.mkEnableOption "enables dconfSettingsModule";
  };

  config = lib.mkIf config.dconfSettingsModule.enable {
    dconf.settings = {
      "org/gnome/desktop/wm/preferences" = { button-layout = ":"; };
    };
  };
}
