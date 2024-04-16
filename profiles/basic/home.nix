{ config, pkgs, pkgs-kdenlive, nix-doom-emacs, stylix, userSettings, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  programs.home-manager.enable = true;

  imports = [
              (./. + "../../../user/wm"+("/"+userSettings.wm+"/"+userSettings.wm)+".nix") # My window manager selected from flake
              #(./. + "../../../user/wm"+("/"+userSettings.wm)+"/output-plasma5.nix")# My window manager selected from flake
              #stylix.homeManagerModules.stylix
              ../../user/app/git/git.nix # My git config
              ../../user/shell/sh.nix # My zsh and bash config
              ../../user/style/stylix.nix # Styling and themes for my apps
              #../../user/shell/cli-collection.nix # Useful CLI apps
              #../../user/app/doom-emacs/doom.nix # My doom emacs config
              #../../user/app/ranger/ranger.nix # My ranger file manager config
              #./../user/app/keepass/keepass.nix # My password manager
              #(./. + "../../../user/app/browser"+("/"+userSettings.browser)+".nix") # My default browser selected from flake
              #../../user/app/virtualization/virtualization.nix # Virtual machines
              #../../user/app/flatpak/flatpak.nix # Flatpaks
              #../../user/lang/cc/cc.nix # C and C++ tools
              #../../user/lang/godot/godot.nix # Game development
              #../../user/pkgs/blockbench.nix # Blockbench ## marked as insecure
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
