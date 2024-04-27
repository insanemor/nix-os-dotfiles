{ config, pkgs, pkgs-kdenlive, userSettings, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  programs.home-manager.enable = true;

  imports = [
              (./. + "../../../user/wm"+("/"+userSettings.wm+"/"+userSettings.wm)+".nix") # My window manager selected from flake
              ../../user/app/git/git.nix # My git config
              ../../user/shell/sh.nix # My zsh and bash config
              ../../user/shell/fzf.nix # fzf config 
              ../../user/style/stylix.nix # Styling and themes for my apps
              ../../user/app/browser/qutebrowser.nix # My browser config
              ../../user/app/browser/brave.nix 
              ../../user/shell/cli-collection.nix # Useful CLI apps
              ../../user/app/vscode/vscode.nix
              #../../user/app/ranger/ranger.nix # My ranger file manager config
              #../../user/app/virtualization/virtualization.nix # Virtual machines
              #../../user/app/flatpak/flatpak.nix # Flatpaks
              #../../user/hardware/bluetooth.nix # Bluetooth
            ];

  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = (with pkgs; [
    # Core
    alacritty
    firefox
    kate

    # Media
    gimp
    vlc

  ]);

  services.syncthing.enable = true;

  home.sessionVariables = {
    EDITOR = userSettings.editor;
    BROWSER = userSettings.browser;
  };

}
