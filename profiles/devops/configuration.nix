# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, lib, systemSettings, userSettings, ... }:

{
  imports =
    [ 
      ../../system/app/podman/podman.nix
      ../../system/app/devbox/devbox.nix
      ../../system/app/1password/1password.nix
      ../../system/app/taskfile/task.nix
    ];

  # System packages
  environment.systemPackages = with pkgs; [
    asdf-vm

  ];

  

}
