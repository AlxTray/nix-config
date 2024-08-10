{ lib, config, ... }:

{
  options = {
    walkerModule.enable =
      lib.mkEnableOption "enables walkerModule";
  };

  config = lib.mkIf config.walkerModule.enable {
    programs.walker = {
      enable = true;
      runAsService = true;
      config = {    
        list = {
          max_entries = 50;
          show_initial_entries = true;
          single_click = true;
        };
        search = {
          delay = 0;
          history = true;
          placeholder = "Search...";
        };
        builtins = {
          applications = {
            actions = true;
            context_aware = true;
            name = "applications";
            placeholder = "Applications";
            prioritize_new = true;
            refresh = true;
            show_sub_when_single = true;
          };
          clipboard = {
            image_height = 300;
            max_entries = 10;
            name = "clipboard";
            placeholder = "Clipboard";
            switcher_only = true;
          };
          commands = {
            name = "commands";
            placeholder = "Commands";
            switcher_only = true;
          };
          custom_commands = {
            name = "custom_commands";
            placeholder = "Custom Commands";
          };
          demenu = {
            name = "dmenu";
            placeholder = "Dmenu";
            switcher_only = true;
          };
          emojis = {
            history = true;
            name = "emojis";
            placeholder = "Emojis";
            switcher_only = true;
            typeahead = true;
          };
          finder = {
            concurrency = 8;
            ignore_gitignore = true;
            name = "finder";
            placeholder = "Finder";
            refresh = true;
            switcher_only = true;
          };
          runner = {
            generic_entry = false;
            history = true;
            name = "runner";
            placeholder = "Runner";
            refresh = true;
            typeahead = true;
          };
          ssh = {
            history = true;
            name = "ssh";
            placeholder = "SSH";
            refresh = true;
            switcher_only = true;
          };
          switcher = {
            name = "switcher";
            placeholder = "Switcher";
            prefix = "/";
          };
          websearch = {
            engines = [ "google" ];
            name = "websearch";
            placeholder = "Websearch";
          };
          windows = {
            name = "windows";
            placeholder = "Windows";
          };
        };
      };
      theme = {
        layout = {
          ui = {
            anchors.top = true;
            window = {
              v_align = "start";
              box = {
                width = 400;
                margins.top = 200;
                v_align = "start";
                h_align = "center";
                search = {
                  width = 400;
                  spacing = 10;
                };
              };
              scroll = {
                list = {
                  width = 400;
                  max_height = 300;
                  min_width = 400;
                  max_width = 400;
                  item = {
                    spacing = 5;
                    activation_label = {
                      x_align = 1.0;
                      width = 20;
                    };
                  };
                  icon.theme = "Papirus-Dark";
                };
              };
            };
          };
        };
        style = ''
          #window,
          #box,
          #search,
          #password,
          #input,
          #typeahead,
          #spinner,
          #list,
          child,
          scrollbar,
          slider,
          #item,
          #text,
          #label,
          #sub,
          #activationlabel {
            all: unset;
          }

          #window {
            background: none;
            color: #dcd7ba;
          }

          #box {
            background: #16161d;
          }

          #search {
            padding-left: 6px;
          }

          #password,
          #input,
          #typeahead {
            padding: 8px;
            background: none;
            box-shadow: none;
            border-radius: 0px;
          }

          #input > *:first-child,
          #typeahead > *:first-child {
            margin-right: 12px;
          }

          #spinner {
          }

          #typeahead {
            color: #72a7bc;
          }

          #input placeholder {
            opacity: 0.5;
          }

          #list {
            background: #16161d;
          }

          child {
            box-shadow: none;
          }

          child:selected,
          child:hover {
            box-shadow: none;
            background: #1f1f28;
          }

          #item {
            padding: 5px;
          }

          #icon {
          }

          #text {
          }

          #label {
          }

          #sub {
            font-size: smaller;
            opacity: 0.5;
          }

          #activationlabel {
            opacity: 0.5;
          }

          .activation #activationlabel {
            opacity: 1;
            color: #72a7bc;
          }

          .activation #text,
          .activation #icon,
          .activation #search {
            opacity: 0.5;
          }
        '';
      };
    };  
  };
}
