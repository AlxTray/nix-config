{ inputs, pkgs, lib, config, ... }:

{
  options = {
    homePackagesModule.enable =
      lib.mkEnableOption "enables homePackagesModule";
  };

  config = lib.mkIf config.homePackagesModule.enable {
    home.packages = with pkgs; [
      (import ../scripts/screenshootin.nix { inherit pkgs; })
      (import ../scripts/wallpaperRandomiser.nix { inherit pkgs lib; })

      inputs.pyprland.packages.${pkgs.system}.pyprland

      networkmanagerapplet
      hyprpicker
      swappy
      vesktop
      gimp
      pavucontrol
      file-roller
      grim
      slurp
      playerctl
      modrinth-app
      libreoffice-fresh
      hunspell
      hunspellDicts.en_GB-large
      cool-retro-term
      yt-dlp
      ani-cli
    ];
  };
}
