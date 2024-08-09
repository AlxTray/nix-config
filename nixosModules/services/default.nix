{ lib, ... }:

{
  imports = [
    ./avahi.nix
    ./keyring.nix
    ./locate.nix
    ./pipewire.nix
    ./printing.nix
    ./ssh.nix
  ];

  avahiModule.enable =
    lib.mkDefault true;
  keyringModule.enable =
    lib.mkDefault true;
  locateModule.enable =
    lib.mkDefault true;
  pipewireModule.enable =
    lib.mkDefault true;
  sshModule.enable =
    lib.mkDefault true;
}
