{ lib, config, ... }:

{
  options = {
    hyprlockModule.enable =
      lib.mkEnableOption "enables hyprlockModule";
  };

  config = lib.mkIf config.hyprlockModule.enable {
    programs.hyprlock = {
      enable = true;
      settings = {
        general = {
          disable_loading_bar = true;
          grace = 10;
          hide_cursor = true;
          no_fade_in = false;
        };
        input-field = [{
          size = "200, 50";
          position = "0, 0";
          dots_center = true;
          fade_on_empty = false;
          font_color = "#${config.stylix.base16Scheme.base07}";
          inner_color = "#${config.stylix.base16Scheme.base00}";
          outer_color = "#131617";
          outline_thickness = 5;
          placeholder_text = "Password...";
          shadow_passes = 2;
        }];
      };
    };
  };
}
