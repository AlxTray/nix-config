{ lib, config, ... }:

{
  options = {
    grubModule.enable =
      lib.mkEnableOption "enables grubModule";
  };

  config = lib.mkIf config.grubModule.enable {
    boot.loader.grub = {
      enable = true;
      efiSupport = true;
      devices = [ "nodev" ];
      useOSProber = true;
    };
  };
}
