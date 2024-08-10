{ pkgs, lib, ... }:

let    
  wallpapersRepo = pkgs.fetchFromGitHub {
    owner = "AngelJumbo";
    repo = "gruvbox-wallpapers";
    rev = "2ff849faa8ef624acf012e4c5d6b412bf4e05b68";
    sha256 = "sha256-QpvBnnYYRZm9Xj6fMlN1kooYzIkn8R5KV7dL+lHzoLE=";
  };

  animeWallpapers =
    lib.filesystem.listFilesRecursive "${wallpapersRepo}/wallpapers/anime";
  pixelWallpapers =
    lib.filesystem.listFilesRecursive "${wallpapersRepo}/wallpapers/pixelart";

  allWallpapers = animeWallpapers ++ pixelWallpapers;
  wallpaperBashArray = ''
    ("${
      lib.strings.concatStrings (lib.strings.intersperse ''" "''
        (map (wallpaper: "${wallpaper}") allWallpapers))
    }")'';
in
pkgs.writeShellScriptBin "wallpaperRandomiser" ''
  wallpapers=${wallpaperBashArray}
  monitor=(`hyprctl monitors | grep Monitor | awk '{print $2}'`)
  for m in ''${monitor[@]}; do
    rand=$[$RANDOM % ''${#wallpapers[@]}]
    wallpaper=''${wallpapers[$rand]}
    swww img -o $m $wallpaper
  done
''
