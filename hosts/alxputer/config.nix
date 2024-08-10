{
  imports = [
    ./hardware.nix
    ./users.nix
  ];

  # Disabled by default
  amdModule.enable = true;
  printingModule.enable = true;
  javaModule.enable = true;
  steamModule.enable = true;
  thunarModule.enable = true;
  libvirtModule.enable = true;
  dockerModule.enable = true;

  system.stateVersion = "23.11";
}
