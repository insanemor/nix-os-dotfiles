{ pkgs, ... }:

{

  home.file."/dconf/default/Taskfile.yml".text = ''

    version: '3'

    tasks:
      hello:
        silent: true
        cmds:
          - echo "Hello from the remote Taskfile!"


  '';

}