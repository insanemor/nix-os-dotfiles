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
      source = ~/.dotfiles/user/wm/hyprland/confs/monitors.conf

      # ----------------------------------------------------- 
      # Autostart
      # ----------------------------------------------------- 
      source = ~/.dotfiles/user/wm/hyprland/confs/autostart.conf

      # ----------------------------------------------------- 
      # Cursor
      # ----------------------------------------------------- 
      source = ~/.dotfiles/user/wm/hyprland/confs/cursor.conf

      # ----------------------------------------------------- 
      # Environment
      # ----------------------------------------------------- 
      source = ~/.dotfiles/user/wm/hyprland/confs/environment.conf

      # ----------------------------------------------------- 
      # Keyboard
      # ----------------------------------------------------- 
      source = ~/.dotfiles/user/wm/hyprland/confs/keyboard.conf

      # ----------------------------------------------------- 
      # Load pywal color file
      # ----------------------------------------------------- 
      source = ~/.dotfiles/user/wm/hyprland/confs/colors-hyprland.conf

      # ----------------------------------------------------- 
      # Load configuration files
      # ----------------------------------------------------- 
      source = ~/.dotfiles/user/wm/hyprland/confs/window.conf
      source = ~/.dotfiles/user/wm/hyprland/confs/decoration.conf
      source = ~/.dotfiles/user/wm/hyprland/confs/layout.conf
      source = ~/.dotfiles/user/wm/hyprland/confs/misc.conf
      source = ~/.dotfiles/user/wm/hyprland/confs/keybinding.conf
      source = ~/.dotfiles/user/wm/hyprland/confs/windowrule.conf

      # ----------------------------------------------------- 
      # Animation
      # ----------------------------------------------------- 
      source = ~/.dotfiles/user/wm/hyprland/confs/animation.conf

      # ----------------------------------------------------- 
      # Custom
      # ----------------------------------------------------- 
      source = ~/.dotfiles/user/wm/hyprland/confs/custom.conf



      
      xwayland {
        force_zero_scaling = true
      }



      # -----------------------------------------------------
    '';
    xwayland = { enable = true; };
    systemd.enable = true;
  };

}