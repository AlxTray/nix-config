{ inputs, pkgs, lib, config, ... }:

{
  options = {
    helixModule.enable =
      lib.mkEnableOption "enables helixModule";
  };

  config = lib.mkIf config.helixModule.enable {
    stylix.targets.helix.enable = false;
    programs.helix = {
      enable = true;
      package = inputs.helix.packages.${pkgs.system}.default;
      defaultEditor = true;
      extraPackages = with pkgs; [
        nixfmt-rfc-style
        nil
        jdt-language-server
        kotlin-language-server
        typescript-language-server
        bash-language-server
        marksman
        nodePackages.vscode-json-languageserver
        yaml-language-server
      ];
      languages.language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt/nixfmt";
        }
      ];
      settings = {
        theme = "gruvbox";
        editor = {
          lsp.display-inlay-hints = true;
          cursor-shape = {
            normal = "block";
            insert = "bar";
            select = "underline";
          };
          popup-border = "all";
          color-modes = true;
          bufferline = "multiple";
        };
      };
    };
  };
}
