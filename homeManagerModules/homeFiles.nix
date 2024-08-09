{ username, lib, config, ... }:

{
  options = {
    homeFilesModule.enable =
      lib.mkEnableOption "enables homeFilesModule";
  };

  config = lib.mkIf config.homeFilesModule.enable {
    home.file = {
      ".config/wlogout/icons" = {
        source = guiPrograms/wlogoutIcons;
        recursive = true;
      };
      ".config/swappy/config".text = ''
        [Default]
        save_dir=/home/${username}/Pictures/Screenshots
        save_filename_format=swappy-%Y%m%d-%H%M%S.png
        show_panel=false
        line_size=5
        text_size=20
        text_font=Inter
        paint_mode=brush
        early_exit=true
        fill_shape=false
      '';
      ".p10k.zsh".source = zsh/p10k.zsh;
      ".config/hypr/pyprland.toml".source = hypr/pyprland.toml;
    };
  };
}
