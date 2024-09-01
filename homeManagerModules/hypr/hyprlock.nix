{ username, lib, config, ... }:

{
  config = lib.mkIf config.hyprlandHomeModule.enable {
    programs.hyprlock = {
      enable = true;
      settings = {
        general = {
          no_fade_in = true;
          no_fade_out = true;
          grace = 0;
          disable_loading_bar = true;
        };

        background = {
          path = "/home/${username}/nix-config/assets/staticBackground.png";
          blur_passes = 2;
          contrast = 1;
          brightness = 0.5;
          vibrancy = 0.2;
          vibrancy_darkness = 0.2;
        };

        input-field = {
          size = "250, 60";
          outline_thickness = 2;
          dots_size = 0.2;
          dots_spacing = 0.35;
          dots_center = true;
          outer_color = "rgba(0, 0, 0, 0)";
          inner_color = "rgba(0, 0, 0, 0.2)";
          font_color = "#${config.stylix.base16Scheme.base07}";
          fade_on_empty = false;
          rounding = -1;
          check_color = "#${config.stylix.base16Scheme.base0B}";
          placeholder_text = "<i><span foreground=\"##cdd6f4\">Input Password...</span></i>";
          hide_input = false;
          position = "0, -200";
          halign = "center";
          valign = "center";
        };

        label = [
          {
            text = "cmd[update:1000] echo \"$(date +\"%A, %B %d\")\"";
            color = "#${config.stylix.base16Scheme.base07}";
            font_size = 22;
            font_family = "${config.stylix.fonts.sansSerif.name}";
            position = "0, 300";
            halign = "center";
            valign = "center";
          }

          {
            text = "cmd[update:1000] echo \"$(date +\"%-I:%M\")\"";
            color = "#${config.stylix.base16Scheme.base07}";
            font_size = 95;
            font_family = "${config.stylix.fonts.sansSerif.name}";
            position = "0, 200";
            halign = "center";
            valign = "center";
          }
        ];  
      };
    };
  };
}
