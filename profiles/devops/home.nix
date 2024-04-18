{ config, pkgs, pkgs-kdenlive, userSettings, ... }:

{

  imports = [
                #../../user/apps/asdf/asdf.nix
            ];

  programs.zsh = {
    initExtra = ''
      . "${pkgs.asdf-vm}/share/asdf-vm/asdf.sh"
      . "${pkgs.asdf-vm}/share/asdf-vm/completions/asdf.bash"
    '';
  };


}
