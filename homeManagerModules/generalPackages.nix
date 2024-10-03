{ pkgs, lib, config, ... }:

{
  options = {
    homePackagesModule.enable =
      lib.mkEnableOption "enables homePackagesModule";
  };

  config = lib.mkIf config.homePackagesModule.enable {
    home.packages = with pkgs; [
      hyprpicker
      swappy
      vesktop
      gimp
      pavucontrol
      file-roller
      grim
      slurp
      playerctl
      libreoffice-fresh
      hunspell
      hunspellDicts.en_GB-large
      cool-retro-term
      yt-dlp
      modrinth-app
      element-desktop

      (ani-cli.override {
        mpv = mpv.override {
          scripts = with pkgs; [
            mpvScripts.mpris
            mpvScripts.modernx-zydezu
            mpvScripts.thumbfast
          ];
        };
      })
    ];
  };
}
