{ inputs, pkgs, lib, config, ... }:

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
        symbol_map = "U+e000-U+e00a,U+ea60-U+ebeb,U+e0a0-U+e0c8,U+e0ca,U+e0cc-U+e0d4,U+e200-U+e2a9,U+e300-U+e3e3,U+e5fa-U+e6b1,U+e700-U+e7c5,U+f000-U+f2e0,U+f300-U+f372,U+f400-U+f532,U+f0001-U+f1af0 Symbols Nerd Font Mono";
      
        scrollback_lines = 2000;
        wheel_scroll_min_lines = 1;
        window_padding_width = 4;
        confirm_os_window_close = 0;
      };
    };
  };
}
