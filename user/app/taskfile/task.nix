{ pkgs, ... }:

{

  home.file."/dconf/default/taskfile.json".text = ''

    version: '3'

    tasks:
      hello:
        silent: true
        cmds:
          - echo "Hello from the remote Taskfile!"


  '';

}