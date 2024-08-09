{ lib, ... }:

{
  imports = [
    ./dconf.nix
    ./generalPackages.nix
    ./gtk.nix
    ./homeFiles.nix
    ./qt.nix
    ./xdg.nix

    ./guiPrograms
    ./hypr
    ./services
    ./terminalPrograms
    ./zsh
  ];

  dconfSettingsModule.enable =
    lib.mkDefault true;
  homePackagesModule.enable =
    lib.mkDefault true;
  gtkModule.enable =
    lib.mkDefault true;
  homeFilesModule.enable =
    lib.mkDefault true;
  qtModule.enable =
    lib.mkDefault true;
  xdgModule.enable =
    lib.mkDefault true;
  zshModule.enable =
    lib.mkDefault true;
}
