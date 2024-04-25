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


  home.file."/dconf/default/.devcontainer/devcontainer.json".text = ''
    {
      "name": "Ferramentas de Desenvolvimento",
      
      "image": "insanemor/tools:3.6",
      
      "service": "dev_container",
      
      "workspaceFolder": "/work",
      
      "settings": { 
        "terminal.integrated.shell.linux": "/bin/zsh"
      },
      
      "extensions": [
        "ms-vscode-remote.remote-containers"
      ],
      
      "remoteUser": "ins",

      "runArgs": [
        "--net=host",
        "--memory=1024mb",
        "--userns=keep-id",
        "-u", "${localEnv:UID}:${localEnv:UID}",
        "-v", "/home/ins/GIT:/work"
      ]

      
    }
  
  '';


}