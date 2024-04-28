{ lib, config, pkgs, userSettings, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  imports = [ ] ++ lib.optional (builtins.pathExists ../../../dconf/clientes/CB/nixos/main.nix) .../../../dconf/clientes/CB/nixos/main.nix;


}
