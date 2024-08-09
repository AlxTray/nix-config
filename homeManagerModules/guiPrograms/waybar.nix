{ pkgs, lib, config, ... }:

{
  options = {
    waybarModule.enable =
      lib.mkEnableOption "enables waybarModule";
  };

  config = lib.mkIf config.waybarModule.enable {
    stylix.targets.waybar.enable = false;
    programs.waybar = {
      enable = true;
      settings = [
  	    {
      	  margin-top = 0;
      	  margin-left = 120;
      	  margin-bottom = 0;
      	  margin-right = 120;
      	  height = 60; 
      	  layer = "top";
      	  position = "top";
      	  spacing = 15;
      	  modules-left = ["custom/launcher" "clock" "clock#date"];
      	  modules-center = ["hyprland/workspaces"];
      	  modules-right = ["pulseaudio" "memory" "tray" "custom/powermenu"];

      	  "hyprland/workspaces" = {
      	      disable-scroll = true;
      	      all-outputs = true;
      	      on-click = "activate";
      	      on-scroll-up = "hyprctl dispatch workspace e+1";
      	      on-scroll-down = "hyprctl dispatch workspace e-1";
      	  };
	  
      	  "custom/launcher" = {
      	      interval = "once";
      	      format = "<span font='FontAwesome' size='20000'> </span>";
      	      on-click = "walker";
      	      tooltip = false;
      	  };

      	  memory = {
      	    interval = 30;
      	    format = "  {}%";
      	    format-alt = "  {used:0.1f}G";
      	    max-length = 10;
      	  };

      	  pulseaudio = {
      	      format = "{icon} {volume}%";
      	      format-bluetooth = "{icon}  {volume}%";
      	      format-bluetooth-muted = "  muted";
      	      format-muted = " muted";
      	      format-icons = {
      		  headphone = " ";
      		  hands-free = " ";
      		  headset = " ";
      		  phone = " ";
      		  portable = " ";
      		  car = " ";
      		  default = ["" "" ""];
      	      };
      	      on-click = "pavucontrol";
      	  };

      	  clock = {
      	    format = " {:%H:%M}";
      	  };

      	  "clock#date" = {
      	    format = " {:%A, %B %d, %Y}";
      	  };

      	  "custom/powermenu" = {
      	    format = "<span font='FontAwesome' size='20000'> </span>";
      	    on-click = "wlogout";
      	    tooltip = false;
      	  };

      	  tray = {
      	    icon-size = 21;
      	    spacing = 3;
      	  };  
  	    }
      ];
      style = lib.concatStrings [
        ''
          *{
        	  font-family: Inter, FontAwesome;
        	  font-size: 16px;
        	  font-weight: bold;
        	  margin: 0;
        	  padding: 0;
        	}

        	window#waybar {
        	  background-color: #${config.stylix.base16Scheme.base00};
        	  color: #${config.stylix.base16Scheme.base07};
        	  transition-property: background-color;
        	  transition-duration: 0.5s;
        	  border-radius: 0px 0px 15px 15px;
        	  transition-duration: .5s;

        	  border-bottom-width: 5px;
        	  border-bottom-color: #131617;
        	  border-bottom-style: solid;
        	}

        	#custom-launcher,
        	#clock,
        	#clock-date,
        	#workspaces,
        	#pulseaudio,
        	#memory,
        	#custom-powermenu,
        	#tray {
        	  background-color: #${config.stylix.base16Scheme.base02};
        	  color: #${config.stylix.base16Scheme.base07};

        	  padding-left: 10px;
        	  padding-right: 10px;
        	  margin-top: 7px;
        	  margin-bottom: 12px;
        	  border-radius: 10px;

        	  border-bottom-width: 5px;
        	  border-bottom-color: #463b37;
        	  border-bottom-style: solid;
        	}

        	#workspaces {
        	  padding: 0;
        	}

        	#workspaces button {
        	  padding-left: 15px;
        	  padding-right: 15px;
        	}

        	#workspaces button:hover { 
            background: #${config.stylix.base16Scheme.base02};
            border: #463b37;
        	  border-radius: 10px;
          }

        	#workspaces button.active {
        	  background-color: #${config.stylix.base16Scheme.base0D};
        	  color: #${config.stylix.base16Scheme.base00};

        	  border-radius: 10px;
	  
        	  padding-left: 20px;
        	  padding-right: 20px;
        	  margin-bottom: -5px;

        	  border-bottom-width: 5px;
        	  border-bottom-color: #637f78;
        	  border-bottom-style: solid;
        	}

        	#custom-launcher {
        	  background-color: #${config.stylix.base16Scheme.base0B};
        	  color: #${config.stylix.base16Scheme.base00};
        	  border-bottom-color: #989b06;

        	  margin-left: 15px;
        	  padding-left: 14px;
            padding-right: 9px;
        	}

        	#custom-powermenu {
        	  background-color: #${config.stylix.base16Scheme.base08};
        	  color: #${config.stylix.base16Scheme.base00};
        	  border-bottom-color: #db2914;

        	  margin-right: 15px;
        	  padding-left: 14px;
            padding-right: 7px;
        	}
        ''
      ];
    };
  };
}
