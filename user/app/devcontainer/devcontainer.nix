{ pkgs, ... }:

{


  home.file."/dconf/default/.devcontainer/devcontainer.json".text = ''
    {
      "name": "Ferramentas de Desenvolvimento",
      
      "image": "docker.io/insanemor/tools:3.6",
      
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
        "-u", "1000:1000",
        "-v", "/home/ins/GIT:/work"
      ]

      
    }
  
  '';


}