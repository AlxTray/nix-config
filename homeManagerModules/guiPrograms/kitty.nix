{ lib, config, ... }:

{
  options = {
    kittyModule.enable =
      lib.mkEnableOption "enables kittyModule";
  };

  config = lib.mkIf config.kittyModule.enable {
    programs.kitty = {
      enable = true;
      shellIntegration.enableZshIntegration = true;
      settings = {
        bold_font = "auto";
        italic_font = "auto";
        bold_italic_font = "auto";
      
        scrollback_lines = 2000;
        wheel_scroll_min_lines = 1;
        window_padding_width = 4;
        confirm_os_window_close = 0;
      };
    };
  };
}
