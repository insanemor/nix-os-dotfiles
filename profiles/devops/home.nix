{ config, pkgs, pkgs-kdenlive, userSettings, ... }:

{

  imports = [
            ../../user/app/asdf/asdf.nix
            ../../user/app/devbox/devbox.nix
            ../../user/app/devcontainer/devcontainer.nix
            ../../user/app/taskfile/task.nix
            ../../user/app/ssh/ssh.nix
            ];

  programs.zsh = {
    initExtra = ''
      . "${pkgs.asdf-vm}/share/asdf-vm/asdf.sh"
      . "${pkgs.asdf-vm}/share/asdf-vm/completions/asdf.bash"
    '';
  };


}
