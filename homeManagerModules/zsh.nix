{ host, username, pkgs, lib, config, ... }:

{
  options = {
    zshModule.enable =
      lib.mkEnableOption "enables zshModule";
  };

  config = lib.mkIf config.zshModule.enable {
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
    };
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autocd = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      plugins = [
        {
          name = "nix-shell";
          src = "${pkgs.zsh-nix-shell}/share/zsh-nix-shell";
        }
        {
          name = "fzf-tab";
          src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
        }
        {
          name = "forgit";
          src = "${pkgs.zsh-forgit}/share/zsh/zsh-forgit";
        }
      ];
      initExtraFirst = ''
        fastfetch
      '';
      shellAliases = {
        fr = "nh os switch --hostname ${host} /home/${username}/nix-config";
        fu =
          "nh os switch --hostname ${host} --update /home/${username}/nix-config";
        ncg =
          "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";

        ls = "eza";
        ll = "eza -la";
        l = "eza -lh";
        lg = "eza -lgh";
        lt = "eza --tree";
        lsm = "eza -lt";
        la = "eza -la";
        lall = "eza -alh";
        lsd = "eza -d";
        lsmod = "eza -lh --time-style=long-iso";
        lr = "eza -R";
        ldir = "eza -l --group-directories-first";
        le = "eza -la --extended";
        lse = "eza -l --sort=ext";
        ltree = "eza --tree --level=2";

        gall = "git add -A";
        gcm = "git commit -m";
        gc = "git commit";
        gp = "git push";
        gpf = "git push --force";
        gpu = "git pull";
        gs = "git status";
      };
    };
  };
}
