{ inputs, pkgs, lib, config, ... }:

{
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  options = {
    stylixModule.enable =
      lib.mkEnableOption "enables stylixModule";
  };

  config = lib.mkIf config.stylixModule.enable {
    stylix = {
      enable = true;
      image = config.lib.stylix.pixel "base00";
      base16Scheme = {
        base00 = "1d2021"; # ----
        base01 = "3c3836"; # ---
        base02 = "504945"; # --
        base03 = "665c54"; # -
        base04 = "bdae93"; # +
        base05 = "d5c4a1"; # ++
        base06 = "ebdbb2"; # +++
        base07 = "fbf1c7"; # ++++
        base08 = "fb4934"; # red
        base09 = "fe8019"; # orange
        base0A = "fabd2f"; # yellow
        base0B = "b8bb26"; # green
        base0C = "8ec07c"; # aqua/cyan
        base0D = "83a598"; # blue
        base0E = "d3869b"; # purple
        base0F = "d65d0e"; # brown
      };
      polarity = "dark";
      cursor.package = pkgs.bibata-cursors;
      cursor.name = "Bibata-Modern-Classic";
      cursor.size = 24;
      fonts = {
        monospace = {
          package = pkgs.jetbrains-mono;
          name = "JetBrains Mono";
        };
        sansSerif = {
          package = pkgs.inter;
          name = "Inter";
        };
        serif = {
          package = pkgs.inter;
          name = "Inter";
        };
        emoji = {
          package = pkgs.noto-fonts-emoji;
          name = "Noto Fonts Emoji";
        };
        sizes = {
          applications = 12;
          terminal = 14;
          desktop = 11;
          popups = 12;
        };
      };
    };
  };
}
