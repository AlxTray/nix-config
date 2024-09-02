{ lib, config, ... }:

{
  options = {
    zshSystemModule.enable =
      lib.mkEnableOption "enables zshSystemModule";
  };

  config = lib.mkIf config.zshSystemModule.enable {
    environment.pathsToLink = [ "/share/zsh" ];
    programs.zsh = {
      enable = true;
      autosuggestions.enable = true;
      syntaxHighlighting = {
        enable = true;
        patterns = { "rm -rf *" = "fg=black,bg=red"; };
        styles = { "alias" = "fg=magenta"; };
        highlighters = [ "main" "brackets" "pattern" ];
      };
    };
  };
}
