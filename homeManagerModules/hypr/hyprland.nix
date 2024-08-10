{ lib, config, ... }:

{
  options = {
    hyprlandModule.enable =
      lib.mkEnableOption "enables hyprlandModule";
  };

  config = lib.mkIf config.hyprlandModule.enable {
    stylix.targets.hyprpaper.enable = false;
    stylix.targets.hyprland.hyprpaper.enable = false;
    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      systemd = {
        enable = true;
        variables = ["--all"];
      };
      extraConfig =
        let
          modifier = "SUPER";
        in
        lib.concatStrings [
          ''
            env = NIXOS_OZONE_WL,1
            env = XDG_CURRENT_DESKTOP,Hyprland
            env = XDG_SESSION_TYPE,wayland
            env = XDG_SESSION_DESKTOP,Hyprland
            env = GDK_BACKEND,wayland,x11
            env = GTK_USE_PORTAL,1
            env = CLUTTER_BACKEND,wayland
            env = QT_QPA_PLATFORM=wayland;xcb
            env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1
            env = QT_AUTO_SCREEN_SCALE_FACTOR,1
            env = SDL_VIDEODRIVER,wayland
            env = MOZ_ENABLE_WAYLAND,1

            exec-once = hyprpaper
            exec-once = wallpaperRandomiser
            exec-once = walker -n
            exec-once = pypr
            exec-once = waybar
            exec-once = nm-applet --indicator

            monitor = DP-1, 2560x1440@165, 0x0, 1
            monitor = HDMI-A-1, 1920x1080@75, 2560x360, 1

  	        workspace = 1, monitor:DP-1, default:true

            general {
              gaps_in = 6
              gaps_out = 20
              border_size = 3
              layout = master
            }
            
            input {
              kb_layout = gb
            }
            
            windowrule = center,^(steam)$
            windowrule = float,nm-connection-editor|blueman-manager
            windowrule = float,pavucontrol
            windowrulev2 = stayfocused, title:^()$,class:^(steam)$
            windowrulev2 = minsize 1 1, title:^()$,class:^(steam)$
            windowrulev2 = opacity 0.9 0.7, class:^(thunar)$
  	        windowrulev2 = opacity 0.9 0.5, class:^(kitty)$
            
            misc {
              initial_workspace_tracking = 0
  	          force_default_wallpaper = 0
  	          disable_hyprland_logo = true

  	          enable_swallow = true
  	          swallow_regex = ^(kitty)$
            }
            
            animations {
              enabled = yes
              bezier = slow,0,0.85,0.3,1
              bezier = overshot,0.7,0.6,0.1,1.1
              bezier = bounce,1,1.6,0.1,0.85
              bezier = slingshot,1,-2,0.9,1.25
              bezier = nice,0,6.9,0.5,-4.20
              bezier = linear, 1, 1, 1, 1
              animation = border, 1, 1, linear
              animation = windows,1,5,bounce,slide
              animation = fade,1,5,default
              animation = workspaces,1,5,overshot,slide
            }
            
            decoration {
              rounding = 10
              drop_shadow = true
              shadow_range = 4
              shadow_render_power = 3
              col.shadow = rgba(1a1a1aee)
              blur {
                enabled = true
                size = 5
                passes = 3
                new_optimizations = on
                ignore_opacity = off
              }
            }
            
            dwindle {
              pseudotile = true
              preserve_split = true
            }

            bind = ${modifier},Return,exec,kitty
            bind = ${modifier},R,exec,walker
            bind = ${modifier},B,exec,firefox
            bind = ${modifier},S,exec,screenshot
            bind = ${modifier}SHIFT,P,exec,wlogout
            bind = ${modifier},T,exec,thunar

            bind = ${modifier},F,exec,pypr toggle yazi
            bind = ${modifier}SHIFT,S,exec,pypr toggle ncspot

            bind = ${modifier},C,killactive,
            bind = ${modifier},P,pseudo,
            bind = ${modifier}SHIFT,I,togglesplit,
            bind = ${modifier}SHIFT,F,togglefloating,
            bind = ${modifier}SHIFT,C,exit,
            bind = ${modifier}SHIFT,left,movewindow,l
            bind = ${modifier}SHIFT,right,movewindow,r
            bind = ${modifier}SHIFT,up,movewindow,u
            bind = ${modifier}SHIFT,down,movewindow,d
            bind = ${modifier}SHIFT,h,movewindow,l
            bind = ${modifier}SHIFT,l,movewindow,r
            bind = ${modifier}SHIFT,k,movewindow,u
            bind = ${modifier}SHIFT,j,movewindow,d
            bind = ${modifier},left,movefocus,l
            bind = ${modifier},right,movefocus,r
            bind = ${modifier},up,movefocus,u
            bind = ${modifier},down,movefocus,d
            bind = ${modifier},h,movefocus,l
            bind = ${modifier},l,movefocus,r
            bind = ${modifier},k,movefocus,u
            bind = ${modifier},j,movefocus,d
            bind = ${modifier},1,workspace,1
            bind = ${modifier},2,workspace,2
            bind = ${modifier},3,workspace,3
            bind = ${modifier},4,workspace,4
            bind = ${modifier},5,workspace,5
            bind = ${modifier},6,workspace,6
            bind = ${modifier},7,workspace,7
            bind = ${modifier},8,workspace,8
            bind = ${modifier},9,workspace,9
            bind = ${modifier},0,workspace,10
            bind = ${modifier}SHIFT,SPACE,movetoworkspace,special
            bind = ${modifier},SPACE,togglespecialworkspace
            bind = ${modifier}SHIFT,1,movetoworkspace,1
            bind = ${modifier}SHIFT,2,movetoworkspace,2
            bind = ${modifier}SHIFT,3,movetoworkspace,3
            bind = ${modifier}SHIFT,4,movetoworkspace,4
            bind = ${modifier}SHIFT,5,movetoworkspace,5
            bind = ${modifier}SHIFT,6,movetoworkspace,6
            bind = ${modifier}SHIFT,7,movetoworkspace,7
            bind = ${modifier}SHIFT,8,movetoworkspace,8
            bind = ${modifier}SHIFT,9,movetoworkspace,9
            bind = ${modifier}SHIFT,0,movetoworkspace,10
            bind = ${modifier}CONTROL,right,workspace,e+1
            bind = ${modifier}CONTROL,left,workspace,e-1
            bind = ${modifier},mouse_down,workspace, e+1
            bind = ${modifier},mouse_up,workspace, e-1
            bindm = ${modifier},mouse:272,movewindow
            bindm = ${modifier},mouse:273,resizewindow
            
            bind = ALT,Tab,cyclenext
            bind = ALT,Tab,bringactivetotop
            bind = ,XF86AudioRaiseVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
            bind = ,XF86AudioLowerVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
            binde = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
            bind = ,XF86AudioPlay, exec, playerctl play-pause
            bind = ,XF86AudioPause, exec, playerctl play-pause
            bind = ,XF86AudioNext, exec, playerctl next
            bind = ,XF86AudioPrev, exec, playerctl previous
          ''
        ];
    };
  };
}
