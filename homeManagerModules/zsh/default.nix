{ host, username, lib, config, ... }:

{
  options = {
    zshModule.enable =
      lib.mkEnableOption "enables zshModule";
  };

  config = lib.mkIf config.zshModule.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      initExtra = ''
        fastfetch
        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      '';
      zplug = {
        enable = true;
        plugins = [
          { name = "zsh-users/zsh-autosuggestions"; }
          { name = "zsh-users/zsh-syntax-highlighting"; }
          {
            name = "romkatv/powerlevel10k";
            tags = [ "as:theme" ];
          }
        ];
      };
      shellAliases = {
        fr = "nh os switch --hostname ${host} /home/${username}/nix-config";
        fu =
          "nh os switch --hostname ${host} --update /home/${username}/nix-config";
        ncg =
          "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
        ls = "eza --icons";
        ll = "eza -lh --icons --grid --group-directories-first";
        la = "eza -lah --icons --grid --group-directories-first";
      };
    };
  };
}
