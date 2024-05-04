{
  lib,
  config,
  pkgs,
  userSettings,
  ...
}: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = userSettings.username;
  home.homeDirectory = "/home/" + userSettings.username;

  programs.home-manager.enable = true;

  imports = [
    ../basic/home.nix # Personal is essentially work system
    ../devops/home.nix
    ../../user/app/libreoffice/libreoffice.nix
    ../../user/app/tuckr/tuckr.nix
  ]; #++ lib.optional (builtins.pathExists ./secrets.nix) ./secrets.nix;

  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    # Core
  ];
}
