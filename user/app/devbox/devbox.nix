{ pkgs, ... }:

{


  #xdg.configFile."~/dconf/.keep".source = builtins.toFile "keep" ""; 

  home.file."/dconf/default/devbox.json".text = ''
    {
      "packages": [],
      "shell": {
        "init_hook": [
          "echo 'Welcome to devbox!' > /dev/null"
        ],
      }

    }
  
  '';




}