{ pkgs, lib, config, ... }:

{
  options = {
    gtkModule.enable =
      lib.mkEnableOption "enables gtkModule";
  };

  config = lib.mkIf config.gtkModule.enable {
    gtk = {
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
      gtk3.extraConfig = { gtk-application-prefer-dark-theme = 1; };
      gtk4.extraConfig = { gtk-application-prefer-dark-theme = 1; };
    };
  };
}
