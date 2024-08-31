{ lib, ... }:

{
  imports = [
    ./bat.nix
    ./btop.nix
    ./direnv.nix
    ./eza.nix
    ./fzf.nix
    ./gh.nix
    ./git.nix
    ./lazygit.nix
    ./ncspot.nix
    ./yazi.nix
    ./zoxide.nix

    ./fastfetch
  ];

  batModule.enable =
    lib.mkDefault true;
  btopModule.enable =
    lib.mkDefault true;
  direnvModule.enable =
    lib.mkDefault true;
  ezaModule.enable =
    lib.mkDefault true;
  fzfModule.enable =
    lib.mkDefault true;
  ghModule.enable =
    lib.mkDefault true;
  gitModule.enable =
    lib.mkDefault true;
  lazygitModule.enable =
    lib.mkDefault true;
  ncspotModule.enable =
    lib.mkDefault true;
  yaziModule.enable =
    lib.mkDefault true;
  zoxideModule.enable =
    lib.mkDefault true;
  fastfetchModule.enable =
    lib.mkDefault true;
}
