{ lib, config, ... }:

{
  options = {
    wlogoutModule.enable =
      lib.mkEnableOption "enables wlogoutModule";
  };

  config = lib.mkIf config.wlogoutModule.enable {
    programs.wlogout = {
      enable = true;
      layout = [
        {
          label = "shutdown";
          action = "systemctl poweroff";
          text = "Shutdown";
          keybind = "s";
        }
        {
          label = "reboot";
          action = "systemctl reboot";
          text = "Reboot";
          keybind = "r";
        }
        {
          label = "logout";
          action = "hyprctl dispatch exit";
          text = "Exit";
          keybind = "e";
        }
        {
          label = "suspend";
          action = "systemctl suspend";
          text = "Suspend";
          keybind = "u";
        }
        {
          label = "lock";
          action = "hyprlock";
          text = "Lock";
          keybind = "l";
        }
        {
          label = "hibernate";
          action = "systemctl hibernate";
          text = "Hibernate";
          keybind = "h";
        }
      ];
      style = ''
        * {
          font-family: ${config.stylix.fonts.sansSerif.name}, FontAwesome;
        	background-image: none;
        	transition: 20ms;
        }

        window {
        	background-color: rgba(12, 12, 12, 0.6);
        }

        button {
        	color: #${config.stylix.base16Scheme.base05};
          font-size:20px;
          background-repeat: no-repeat;
        	background-position: center;
        	background-size: 25%;
        	border-style: solid;
          border-radius: 10px;
        	background-color: rgba(12, 12, 12, 0.3);
        	border: 3px solid #${config.stylix.base16Scheme.base03};
        }

        button:focus,
        button:active,
        button:hover {
          background-color: rgba(12, 12, 12, 0.5);
          border: 3px solid #${config.stylix.base16Scheme.base0D};
        }

        #logout {
        	margin: 10px;
        	border-radius: 20px;
        	background-image: image(url("icons/logout.png"));
        }

        #suspend {
        	margin: 10px;
        	border-radius: 20px;
        	background-image: image(url("icons/suspend.png"));
        }

        #shutdown {
        	margin: 10px;
        	border-radius: 20px;
        	background-image: image(url("icons/shutdown.png"));
        }

        #reboot {
        	margin: 10px;
        	border-radius: 20px;
        	background-image: image(url("icons/reboot.png"));
        }

        #lock {
        	margin: 10px;
        	border-radius: 20px;
        	background-image: image(url("icons/lock.png"));
        }

        #hibernate {
        	margin: 10px;
        	border-radius: 20px;
        	background-image: image(url("icons/hibernate.png"));
        }
      '';
    };
  };
}
