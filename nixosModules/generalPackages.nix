{ pkgs, lib, config, ... }:

{
  options = {
    systemPackagesModule.enable =
      lib.mkEnableOption "enables systemPackagesModule";
  };

  config = lib.mkIf config.systemPackagesModule.enable {
    environment.systemPackages = with pkgs; [
      pkg-config
      libnotify
      ydotool
      wl-clipboard
      ffmpeg
      ripgrep
      inxi
      nh
    ];
  };
}
