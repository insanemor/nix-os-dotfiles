{ config, lib, pkgs, userSettings, systemSettings, ... }:

{
  
  wayland.windowManager.hyprland = {
    enable = true;
    plugins = [ ];
    settings = { };
    extraConfig = ''

      # -----------------------------------------------------
      #  _   _                  _                 _  
      # | | | |_   _ _ __  _ __| | __ _ _ __   __| | 
      # | |_| | | | | '_ \| '__| |/ _` | '_ \ / _` | 
      # |  _  | |_| | |_) | |  | | (_| | | | | (_| | 
      # |_| |_|\__, | .__/|_|  |_|\__,_|_| |_|\__,_| 
      #        |___/|_|                              
      #  
      # -----------------------------------------------------

      # ----------------------------------------------------- 
      # Environment for xdg-desktop-portal-hyprland
      # ----------------------------------------------------- 
      exec-once = dbus-update-activation-environment DISPLAY XAUTHORITY WAYLAND_DISPLAY
      exec = ~/.swaybg-stylix

      # ----------------------------------------------------- 
      # Monitor
      # ----------------------------------------------------- 
      source = ~/dotfiles/user/wm/hyprland/conf/monitors.conf

      # ----------------------------------------------------- 
      # Autostart
      # ----------------------------------------------------- 
      source = ~/dotfiles/user/wm/hyprland/conf/autostart.conf

      # ----------------------------------------------------- 
      # Cursor
      # ----------------------------------------------------- 
      source = ~/dotfiles/user/wm/hyprland/conf/cursor.conf

      # ----------------------------------------------------- 
      # Environment
      # ----------------------------------------------------- 
      source = ~/dotfiles/user/wm/hyprland/conf/environment.conf

      # ----------------------------------------------------- 
      # Keyboard
      # ----------------------------------------------------- 
      source = ~/dotfiles/user/wm/hyprland/conf/keyboard.conf

      # ----------------------------------------------------- 
      # Load pywal color file
      # ----------------------------------------------------- 
      source = ~/dotfiles/user/wm/hyprland/conf/colors-hyprland.conf

      # ----------------------------------------------------- 
      # Load configuration files
      # ----------------------------------------------------- 
      source = ~/dotfiles/user/wm/hyprland/conf/window.conf
      source = ~/dotfiles/user/wm/hyprland/conf/decoration.conf
      source = ~/dotfiles/user/wm/hyprland/conf/layout.conf
      source = ~/dotfiles/user/wm/hyprland/conf/misc.conf
      source = ~/dotfiles/user/wm/hyprland/conf/keybinding.conf
      source = ~/dotfiles/user/wm/hyprland/conf/windowrule.conf

      # ----------------------------------------------------- 
      # Animation
      # ----------------------------------------------------- 
      source = ~/dotfiles/user/wm/hyprland/conf/animation.conf

      # ----------------------------------------------------- 
      # Custom
      # ----------------------------------------------------- 
      source = ~/dotfiles/user/wm/hyprland/conf/custom.conf

      # -----------------------------------------------------
    '';
    xwayland = { enable = true; };
    systemd.enable = true;
  };

}