{ lib, config, ... }:

{
  options = {
    nixSettingsModule.enable =
      lib.mkEnableOption "enables nixSettingsModule";
  };

  config = lib.mkIf config.nixSettingsModule.enable {
    nix.settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [ 
        "https://hyprland.cachix.org"
        "https://walker.cachix.org"
      ];
      trusted-public-keys = [ 
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM="
      ];
    };
  };
}
